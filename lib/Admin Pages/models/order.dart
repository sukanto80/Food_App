import 'menu_item.dart';

class Order {
  final String id;
  final String userId;
  final String restaurantId;
  final List<MenuItem> items;
  final DateTime date;

  Order({
    required this.id,
    required this.userId,
    required this.restaurantId,
    required this.items,
    required this.date,
  });
}
