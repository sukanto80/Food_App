import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/food_management_controller.dart';

class ApprovedFoodItemsScreen extends StatefulWidget {
  @override
  _ApprovedFoodItemsScreenState createState() => _ApprovedFoodItemsScreenState();
}

class _ApprovedFoodItemsScreenState extends State<ApprovedFoodItemsScreen> {
  List<Map<String, dynamic>> approvedFoodItems = [];
  bool isLoading = true;
  final controller = Get.put(FoodManagementController());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    fetchUnapprovedFoodItems();
  }

  Future<void> fetchUnapprovedFoodItems() async {
    approvedFoodItems.clear();
    try {


          QuerySnapshot foodItemsSnapshot = await FirebaseFirestore.instance
              .collection('foodItems')
              .where('approved', isEqualTo: true)
              .get();

          for (var foodItemDoc in foodItemsSnapshot.docs) {
            String foodItemId = foodItemDoc.id;
            approvedFoodItems.add({
              'sellerId': foodItemDoc['seller_id'],
              'categoryId': foodItemDoc['category_id'],
              'foodId': foodItemId,
              'name': foodItemDoc['name'],
              'description': foodItemDoc['description'],
              'price': foodItemDoc['price'],
              'image': foodItemDoc['image'],
              'approved':foodItemDoc['approved']
            });

      }
    } catch (e) {
      print('Error retrieving unapproved food items: $e');
    } finally {
      setState(() {
        isLoading = false; // Update loading state
      });
    }
  }

  // Function to approve a food item


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approved Food Items'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: approvedFoodItems.length,
        itemBuilder: (context, index) {
          final foodItem = approvedFoodItems[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 380,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white, //grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0,3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      foodItem['image'],fit: BoxFit.cover,
                      height: 80,
                      width: 150,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        foodItem['name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                ],
              ),

            ),
          );
        },
      ),
    );
  }
}