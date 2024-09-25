// lib/providers/item_provider.dart
import 'package:domi/models/items.dart';
import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [
    Item(
      title: '100 Martinique Ave Title',
      description: 'Property Title Details',
      dateOpened: 'Dec 4, 2023',
    ),
    Item(
      title: 'Chase Bank Statement - November 2023',
      description: 'Financial Statement Details',
      dateOpened: 'Dec 3, 2023',
    ),
    // Add more items as needed.
  ];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
