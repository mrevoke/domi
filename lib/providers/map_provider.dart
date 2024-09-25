import 'package:flutter/material.dart';

class MapProvider extends ChangeNotifier {
  int? selectedHomeIndex;

  void selectHome(int? index) {
    selectedHomeIndex = index;
    notifyListeners();
  }

  void deselectHome() {
    selectedHomeIndex = null;
    notifyListeners();
  }
}
