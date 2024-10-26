// To parse this JSON data, do
//
//     final foodItem = foodItemFromJson(jsonString);

import 'dart:convert';

FoodItem foodItemFromJson(String str) => FoodItem.fromJson(json.decode(str));

String foodItemToJson(FoodItem data) => json.encode(data.toJson());

class FoodItem {
  String? name;
  String? description;
  String? price;
  bool? approved;

  FoodItem({
    this.name,
    this.description,
    this.price,
    this.approved,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
    name: json["name"],
    description: json["description"],
    price: json["price"],
    approved: json["approved"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "price": price,
    "approved": approved,
  };
}
