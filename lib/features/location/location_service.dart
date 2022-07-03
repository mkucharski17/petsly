import 'dart:async';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

enum PermissionRequestResult { granted, denied, deniedForever }

class LocationService {
  LocationService(this._location) {}

  final Location _location;

  void init() {
    locations = _location.onLocationChanged
        .where((event) => event.latitude != null && event.longitude != null)
        .map(_mapLocationData);
  }

  Future<PermissionRequestResult>? requestPermissionFuture;

  Future<PermissionRequestResult> requestPermission() async {
    return requestPermissionFuture ??= () async {
      final hasPermission = await _location.hasPermission();

      if (hasPermission == PermissionStatus.deniedForever) {
        requestPermissionFuture = null;
        return PermissionRequestResult.deniedForever;
      } else if (hasPermission == PermissionStatus.denied) {
        final permission = await _location.requestPermission();
        requestPermissionFuture = null;

        if (permission == PermissionStatus.denied) {
          return PermissionRequestResult.denied;
        } else if (permission == PermissionStatus.deniedForever) {
          return PermissionRequestResult.deniedForever;
        }
      }
      requestPermissionFuture = null;
      init();
      return PermissionRequestResult.granted;
    }();
  }

  Future<LatLng?> getLocation() async {
    try {
      final res =
          await _location.getLocation().timeout(const Duration(seconds: 2));

      if (res.latitude != null && res.longitude != null) {
        return LatLng(res.latitude!, res.longitude!);
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      return null;
    } on PlatformException catch (_) {
      return null;
    }
  }

  Stream<LatLng>? locations;

  LatLng _mapLocationData(LocationData ld) {
    return LatLng(ld.latitude!, ld.longitude!);
  }
}
