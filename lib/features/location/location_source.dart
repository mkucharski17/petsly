import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petsly/features/location/location_service.dart';

class LocationSource {
  const LocationSource(this._locationService);

  static final defaultLocation = const LatLng(52.237049, 21.017532);

  final LocationService _locationService;

  Future<LatLng> getInitialLocation() async {
    final result = await _locationService.requestPermission();

    if (result == PermissionRequestResult.granted) {
      final loc = await _locationService.getLocation();

      if (loc != null) {
        return LatLng(loc.latitude, loc.longitude);
      } else {
        return defaultLocation;
      }
    } else {
      return defaultLocation;
    }
  }
}
