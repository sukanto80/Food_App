import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/food_management_controller.dart';

class UnapprovedFoodItemsScreen extends StatefulWidget {
  @override
  _UnapprovedFoodItemsScreenState createState() => _UnapprovedFoodItemsScreenState();
}

class _UnapprovedFoodItemsScreenState extends State<UnapprovedFoodItemsScreen> {
  List<Map<String, dynamic>> unapprovedFoodItems = [];
  bool isLoading = true;
  final controller = Get.put(FoodManagementController());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    fetchUnapprovedFoodItems();
  }

  Future<void> fetchUnapprovedFoodItems() async {
    unapprovedFoodItems.clear();
    try {


          QuerySnapshot foodItemsSnapshot = await FirebaseFirestore.instance
              .collection('foodItems')
              .where('approved', isEqualTo: false)
              .get();

          for (var foodItemDoc in foodItemsSnapshot.docs) {
            String foodItemId = foodItemDoc.id;
            unapprovedFoodItems.add({
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
  Future<void> approveFoodItem(String sellerId, String categoryId, String foodItemId) async {


    try {


      // Check if the admin is authenticated

        // Update the food item to set approved to true
        await firestore
            .collection('foodItems').doc(foodItemId)
            .update({'approved': true}).whenComplete(()
              {
                Get.snackbar(
                  "Success",
                  "Your Product has been Approved.",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.white,
                  colorText: Colors.green,
                );

                fetchUnapprovedFoodItems();

              }


        );

        print('Food item approved successfully!');

    } catch (e) {
      print('Error approving food item: $e');
    }finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unapproved Food Items'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: unapprovedFoodItems.length,
        itemBuilder: (context, index) {
          final foodItem = unapprovedFoodItems[index];

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      foodItem['image'],fit: BoxFit.cover,
                      height: 80,
                      width: 100,
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

                  GestureDetector(
                   onTap: (){
                     approveFoodItem(foodItem['sellerId'],foodItem['categoryId'],foodItem['foodId']);
                   },
                    child:  Container(
                      height: 35,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('Approve',style: TextStyle(color: Colors.white),),
                    ),
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