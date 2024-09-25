// lib/providers/app_state.dart
import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  bool _isMapView = false;

  bool get isMapView => _isMapView;

  void toggleMapView() {
    _isMapView = !_isMapView;
    notifyListeners();
  }
}
