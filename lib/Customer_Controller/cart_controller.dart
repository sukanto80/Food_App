



import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/state_manager.dart';

import '../Session/session.dart';
import '../Widgets/success_message.dart';
import 'all_food_controller.dart';

class CartController extends GetxController {

  static CartController get instance => Get.find();
  final controller = Get.put(CustomerFoodGetController());
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  String ? id;

  var totalAmount=0.0.obs;
  var totalItem = 0.obs;
  
  getId() async {
    await MyPrefs.getId().then((value) {
      id = value;
    });
    print(id);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getId();
   // getTotalAmount(cartItem!);


  }


  Future<void> addToCart(String FoodId,String sellerId, String productName,String description, double price, String imageUrl) async {
    final cartItemId = '${id}_${FoodId}';

    final cartItemRef = FirebaseFirestore.instance
        .collection('customer')
        .doc(id)
        .collection('cart')
        .doc(cartItemId); // Use productId as the cart item ID

    // Check if the product is already in the cart
    final cartItemSnapshot = await cartItemRef.get();

    if (cartItemSnapshot.exists) {
      // If the item is already in the cart, increase its quantity
      cartItemRef.update({
        'quantity': FieldValue.increment(1),
      }).whenComplete((){
        getCartItems();
        Get.snackbar(
          "Success",
          "Your Product has been Add to Cart",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          colorText: Colors.green,
        );
      });
    } else {
      // If it's a new item, add it to the cart
      cartItemRef.set({
        'productId': FoodId,
        'sellerId':sellerId,
        'customerId':id,
        'productName': productName,
        'price': price,
        'description':description,
        'quantity': 1, // Start with a quantity of 1
        'imageUrl': imageUrl,
      }).whenComplete(() {
        getCartItems();
        Get.snackbar(
          "Success",
          "Your Product has been Add to Cart",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          colorText: Colors.green,
        );
      });
    }
  }


  Future<void> updateCartQuantity(String productId, int quantity) async {
    final cartItemId = '${id}_${productId}';
    final cartItemRef = FirebaseFirestore.instance
        .collection('customer')
        .doc(id)
        .collection('cart')
        .doc(cartItemId); // Use productId as the cart item ID

    // Update the quantity or remove if the quantity is zero
    if (quantity > 0) {
      cartItemRef.update({'quantity': quantity}).whenComplete(() => getCartItems());
    } else {
      cartItemRef.delete();// Remove the item from the cart if quantity is zero
      getCartItems();
    }
  }



  Stream<List<CartItem>> getCartItems() {

    return FirebaseFirestore.instance
        .collection('customer')
        .doc(id)
        .collection('cart')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => CartItem.fromFirestore(doc)).toList());
  }


  Future<void>getTotalPriceInformation(List<CartItem> cartItem)async {
    for (var cartItemDoc in cartItem) {
      totalAmount.value+= cartItemDoc.price*cartItemDoc.quantity;
      update();
      totalItem.value = cartItem.length;
      update();

    }

    print("Total Amount : ${totalAmount}");
  }

  String generateFoodOrderId() {
    final now = DateTime.now();
    final datePart = "${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}";

    // Generating a random 3-letter and 3-digit string (e.g., "XYZ123")
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    final random = Random();

    String randomLetters = String.fromCharCodes(
      Iterable.generate(3, (_) => letters.codeUnitAt(random.nextInt(letters.length))),
    );

    String randomNumbers = String.fromCharCodes(
      Iterable.generate(3, (_) => numbers.codeUnitAt(random.nextInt(numbers.length))),
    );

    return "FOOD-$datePart-$randomLetters$randomNumbers"; // Example: FOOD-20241025-XYZ123
  }

  // Create a new order and add items as a subcollection
  Future<void> createOrder(List<CartItem> items, double totalAmount,int quantity,String address,BuildContext context) async {
    final customOrderId = generateFoodOrderId();
    // Create a new order document
    DocumentReference orderRef = await firestore.collection('orders').add({
      'foodOrderId':customOrderId,
      'customerId': id,
      'totalAmount': totalAmount,
      'total_item': quantity,
      'orderDate': FieldValue.serverTimestamp(),
      // You can set the initial status of the order
      'address': address, // You can set the initial status of the order
    });

    // Add items as a subcollection under the order document
    for (var item in items) {
        await orderRef.collection('items').add({

        'foodItemId': item.productId,
        //'item_id': itemDocument.id,
        'order_id': orderRef.id,
        'foodOrderId': customOrderId,
        'sellerId': item.sellerId,
        'foodName': item.productName,
        'quantity': item.quantity,
        'price': item.price,
        'status': 'Pending',

      }).then((docRef) async {
          // After adding the item, update the document with its own ID
          await docRef.update({
            'item_id': docRef.id,
          });
        }).whenComplete(() {
        deleteCart();
        controller.UpdatePopularFood(item.productId);
        controller.fetchPopularFood();
        showSuccessDialog(context);
      });
    }
  }

  deleteCart() async {

    // Reference to the user's cart subcollection
    final cartRef = FirebaseFirestore.instance
        .collection('customer')
        .doc(id)
        .collection('cart');

    // Get all documents in the cart collection
    final cartItemsSnapshot = await cartRef.get();

    // Batch delete all documents in the cart collection
    WriteBatch batch = FirebaseFirestore.instance.batch();

    for (var doc in cartItemsSnapshot.docs) {
      batch.delete(doc.reference);
    }

    // Commit the batch operation to delete all cart items
    await batch.commit();
  }


// Get all orders for a specific customer
  Future<List<Map<String, dynamic>>> getOrdersForCustomer() async {
    QuerySnapshot snapshot = await firestore.collection('orders')
        .where('customerId', isEqualTo: id)
        .get();

    return snapshot.docs.map((doc) {
      // Include the order ID in the returned data
      return {
        'id': doc.id, // This is the order ID
        ...doc.data() as Map<String, dynamic>,
      };
    }).toList();
  }



}

class CartItem {
  final String productId;
  final String sellerId;
  final String customerId;
  final String productName;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItem({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.sellerId,
    required this.customerId
  });

  factory CartItem.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CartItem(
      productId: data['productId'],
      productName: data['productName'],
      description: data['description'],
      price: data['price'],
      quantity: data['quantity'],
      imageUrl: data['imageUrl'],
      sellerId: data['sellerId'],
      customerId:  data['customerId'],
    );
  }


}