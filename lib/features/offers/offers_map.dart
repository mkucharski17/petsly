import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petsly/data/offer/offer.dart';
import 'package:petsly/features/location/location_source.dart';
import 'package:petsly/features/offers/bloc/offers_cubit.dart';
import 'package:petsly/features/offers/favourites_page.dart';
import 'package:petsly/features/offers/filters_dialog.dart';
import 'package:petsly/features/offers/offer_details/offer_details_screen.dart';

class OffersMapPage extends Page<void> {
  const OffersMapPage({LocalKey? key}) : super(key: key);

  @override
  Route<void> createRoute(BuildContext context) =>
      OffersMapScreenRoute(page: this);
}

class OffersMapScreenRoute extends MaterialPageRoute<void> {
  OffersMapScreenRoute({OffersMapPage? page})
      : super(
          settings: page,
          builder: (context) => const OffersMapBuilder(),
        );
}

class OffersMapBuilder extends HookWidget {
  const OffersMapBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final markers = useState(<Marker>{});

    final clusterManager = useMemoized(
      () => ClusterManager<Offer>(
        context
            .read<OffersCubit>()
            .state
            .filteredOffers
            .map((e) => e.data().toCLusterItem()),
        (m) => markers.value = m,
        levels: [1, 4.25, 6.75, 8.25, 11.5, 14.5, 16.0, 16.5, 20.0],
        markerBuilder: (cluster) => _markerBuilder(context, cluster),
        initialZoom: 10,
        stopClusteringZoom: 11,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Znajdź pomoc'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).push(FavouritesScreenRoute()),
            icon: const Icon(Icons.favorite_outline),
          ),
          IconButton(
            onPressed: () => FiltersDialog.show(
              context,
              initialFilters: context.read<OffersCubit>().state.filters,
            ),
            icon: const Icon(Icons.tune),
          ),
        ],
      ),
      body: BlocConsumer<OffersCubit, OffersState>(
        listener: (context, state) {
          clusterManager.setItems(state.filteredOffers
              .map((e) => e.data().toCLusterItem())
              .toList());
        },
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return _OffersMap(
            markers: markers.value,
            clusterManager: clusterManager,
          );
        },
      ),
    );
  }

  Future<Marker> _markerBuilder(
          BuildContext context, Cluster<Offer> cluster) async =>
      buildMarker(context, cluster);
}

class _OffersMap extends HookWidget {
  const _OffersMap({
    Key? key,
    required this.clusterManager,
    required this.markers,
  }) : super(key: key);

  final ClusterManager clusterManager;
  final Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng>(
      future: context.read<LocationSource>().getInitialLocation(),
      builder: (context, snapshot) {
        late LatLng location;

        if (snapshot.hasData) {
          location = snapshot.data!;
          return Stack(
            children: [
              GoogleMap(
                markers: markers,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: true,
                initialCameraPosition: CameraPosition(
                  zoom: 10,
                  target: location,
                ),
                onCameraMove: (position) {
                  clusterManager.onCameraMove(position);
                },
                onMapCreated: (GoogleMapController controller) {
                  clusterManager.setMapController(controller);
                },
                onCameraIdle: () {
                  clusterManager.updateMap();
                },
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

Future<Marker> buildMarker(BuildContext context, Cluster<Offer> cluster) async {
  final item = cluster.items.first!;
  final infoWindow = !cluster.isMultiple
      ? InfoWindow(
          title: item.title,
          snippet: item.animalTypes.snippet(),
          onTap: () {
            Navigator.of(context).push(OfferDetailsScreenRoute(offer: item));
          },
        )
      : InfoWindow.noText;

  return Marker(
    markerId: MarkerId(cluster.getId()),
    position: cluster.location,
    infoWindow: infoWindow,
    icon: cluster.isMultiple
        ? await getNotChosenClusterBitmap(
            circleSize: 110,
            color: Colors.blue,
            borderColor: Colors.blue.withOpacity(0.28),
            borderSize: 20,
            text: cluster.count.toString(),
          )
        : await getChosenMarkerBitmap(
            circleSize: 50,
            color: Colors.blue,
            borderColor: Colors.white,
            borderSize: 15,
          ),
  );
}

Future<BitmapDescriptor> getChosenMarkerBitmap({
  required int circleSize,
  required Color color,
  required Color borderColor,
  required int borderSize,
  Color? shadowColor,
  int? shadowSize,
  String? text,
}) async {
  final size = circleSize + borderSize + (shadowSize ?? 0);
  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint1 = Paint()..color = color;
  final Paint paint2 = Paint()..color = borderColor;

  if (shadowColor == null) {
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint2);
    canvas.drawCircle(
      Offset(size / 2, size / 2),
      (size - borderSize) / (2.0),
      paint1,
    );
  }

  if (shadowSize != null && shadowColor != null) {
    final Paint paint3 = Paint()..color = shadowColor;
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint3);
    canvas.drawCircle(
      Offset(size / 2, size / 2),
      (size - shadowSize) / 2.0,
      paint2,
    );
    canvas.drawCircle(
      Offset(size / 2, size / 2),
      (size - shadowSize - borderSize) / 2.0,
      paint1,
    );
  }
  if (text != null) {
    paintText(text, canvas, size);
  }

  final img = await pictureRecorder.endRecording().toImage(size, size);
  final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

  return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
}

Future<BitmapDescriptor> getNotChosenClusterBitmap({
  required int circleSize,
  required Color color,
  required Color borderColor,
  required int borderSize,
  required String text,
}) async {
  final size = circleSize + borderSize;
  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint1 = Paint()..color = color;
  final Paint paint2 = Paint()..color = borderColor;

  canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
  canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint2);
  canvas.drawCircle(
    Offset(size / 2, size / 2),
    (size - borderSize) / 2.0,
    paint1,
  );

  paintText(text, canvas, size);

  final img = await pictureRecorder.endRecording().toImage(size, size);
  final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

  return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
}

void paintText(String text, Canvas canvas, int size) {
  final painter = TextPainter(textDirection: TextDirection.ltr);

  painter.text = TextSpan(
    text: text,
    style: const TextStyle(
      fontSize: 40,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
  );
  painter.layout();
  painter.paint(
    canvas,
    Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
  );
}
