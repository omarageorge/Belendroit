import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:belendroit/providers/location_provider.dart';

class LocationManager {
  static Future<void> requestPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
  }

  static Future<void> determineLocality(BuildContext context) async {
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((position) {
      placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      ).then((placemarks) {
        Provider.of<LocationProvider>(context, listen: false)
            .setCity(placemarks[0].locality!);
      });
    }).catchError((e) {
      print(e);
    });
  }
}
