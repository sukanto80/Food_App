import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }

  void deleteOrder(String id) {
    _orders.removeWhere((o) => o.id == id);
    notifyListeners();
  }
}
