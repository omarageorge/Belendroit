import 'package:flutter/foundation.dart';

class LocationProvider extends ChangeNotifier {
  String _city = 'Kampala';

  String get city => _city;

  void setCity(String city) {
    _city = city;
    notifyListeners();
  }
}
