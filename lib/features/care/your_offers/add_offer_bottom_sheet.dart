import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petsly/features/location/location_service.dart';
import 'package:petsly/features/location/location_source.dart';
import 'package:provider/provider.dart';

class AddOfferBottomSheet extends HookWidget {
  const AddOfferBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useState<GoogleMapController?>(null);

    return StreamBuilder<LatLng>(
      stream: context.read<LocationService>().locations,
      builder: (context, snapshot) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: const Radius.circular(16),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wybierz lokalizacje oferty',
                      style: TextStyle(fontSize: 18),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // context.read<Firestore>().addDocument(
                        //     collectionPath: 'offers', data: Offer(
                        //     id: Uuid.,
                        //     ownerId: FirebaseAuth.instance.currentUser!.uid,
                        //     title: title,
                        //     description: description,
                        //     animalTypes: animalTypes,
                        //     latLng: latLng,
                        //     availableDays: availableDays))
                        // Navigator.of(context).pushReplacement(
                        //     EditableOfferScreenRoute(doc: doc));
                      },
                      child: const Text('Zatwierdź'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        myLocationEnabled: true,
                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: true,
                        initialCameraPosition: CameraPosition(
                          zoom: 13,
                          target:
                              snapshot.data ?? LocationSource.defaultLocation,
                        ),
                        onCameraMove: (position) {},
                        onMapCreated: (GoogleMapController mapController) {
                          controller.value = mapController;
                        },
                        onCameraIdle: () {},
                      ),
                      const Icon(
                        Icons.location_pin,
                        color: Colors.blue,
                        size: 48,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> show(
    BuildContext context,
  ) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddOfferBottomSheet(),
    );
  }
}
