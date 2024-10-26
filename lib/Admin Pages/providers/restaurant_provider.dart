import 'package:flutter/material.dart';
import '../models/restaurant.dart';

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> _restaurants = [];

  List<Restaurant> get restaurants => _restaurants;

  void addRestaurant(Restaurant restaurant) {
    _restaurants.add(restaurant);
    notifyListeners();
  }

  void editRestaurant(Restaurant restaurant) {
    final index = _restaurants.indexWhere((r) => r.id == restaurant.id);
    if (index != -1) {
      _restaurants[index] = restaurant;
      notifyListeners();
    }
  }

  void deleteRestaurant(String id) {
    _restaurants.removeWhere((r) => r.id == id);
    notifyListeners();
  }
}
