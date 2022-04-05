import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petsly/features/location/location_source.dart';
import 'package:provider/provider.dart';

class OffersMap extends HookWidget {
  const OffersMap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final markers = useState(<Marker>{});
    final clusterManager = useMemoized(
      () => ClusterManager<List<LatLng>>(
        [
          ClusterItem(const LatLng(52.237049, 21.017532)),
          ClusterItem(const LatLng(52.247049, 21.013232)),
        ],
        (Set<Marker> m) => markers.value = m,
        levels: [1, 4.25, 6.75, 8.25, 11.5, 14.5, 16.0, 16.5, 20.0],
        markerBuilder: _markerBuilder,
        initialZoom: 10,
        stopClusteringZoom: 11,
      ),
    );

    return FutureBuilder<LatLng>(
      future: context.read<LocationSource>().getInitialLocation(),
      builder: (context, snapshot) {
        late LatLng location;

        if (snapshot.hasData) {
          location = snapshot.data!;
          return Stack(
            children: [
              GoogleMap(
                markers: markers.value,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
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
        } else
          return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<Marker> _markerBuilder(Cluster<List<LatLng>> cluster) async =>
      buildMarker(cluster);
}

Future<Marker> buildMarker(Cluster<List<LatLng>> cluster) async => Marker(
      markerId: MarkerId(cluster.getId()),
      position: cluster.location,
      icon: cluster.isMultiple
          ? await getNotChosenClusterBitmap(
              circleSize: 110,
              color: Colors.blue,
              borderColor: Colors.blue.withOpacity(0.28),
              borderSize: 10,
              text: cluster.count.toString(),
            )
          : await getChosenMarkerBitmap(
              circleSize: 40,
              color: Colors.blue,
              borderColor: Colors.white,
              borderSize: 10,
            ),
    );

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
