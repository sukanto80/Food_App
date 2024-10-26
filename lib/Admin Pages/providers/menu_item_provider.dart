import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuItemProvider with ChangeNotifier {
  List<MenuItem> _menuItems = [];

  List<MenuItem> get menuItems => _menuItems;

  void addMenuItem(MenuItem menuItem) {
    _menuItems.add(menuItem);
    notifyListeners();
  }

  void editMenuItem(MenuItem menuItem) {
    final index = _menuItems.indexWhere((m) => m.id == menuItem.id);
    if (index != -1) {
      _menuItems[index] = menuItem;
      notifyListeners();
    }
  }

  void deleteMenuItem(String id) {
    _menuItems.removeWhere((m) => m.id == id);
    notifyListeners();
  }
}
