import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Controller/upload_product_controller.dart';

class FoodItemsScreen extends StatefulWidget {
  @override
  _FoodItemsScreenState createState() => _FoodItemsScreenState();
}

class _FoodItemsScreenState extends State<FoodItemsScreen> {
  final controller = Get.put(UploadProductController());

  @override
  void initState() {
    super.initState();
      // Fetch all sellers, categories, and food items
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Food Items')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: controller.AllFoodItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No food items found.'));
          }

          // Display the food items
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {

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
                      SizedBox(width: 20,),
                      Container(
                        alignment: Alignment.center,
                        child: Image.network(
                          snapshot.data![index]['image'],
                          fit: BoxFit.cover,
                          height: 80,
                          width: 100,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 190,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                        snapshot.data![index]['name'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data![index]['description'],
                              style: TextStyle(
                                fontSize:20,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data![index]['price'],
                              style: TextStyle(
                                color: Colors.red,
                                fontSize:16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical:12,horizontal:10,),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          /*    child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Icon(
                                   CupertinoIcons.minus,
                                   color: Colors.white,
                                 ),
                                 Text(
                                   "2",
                                   style: TextStyle(
                                     fontSize:14,
                                    fontWeight: FontWeight.bold,
                                   ),
                                 ),
                                Icon(
                                   CupertinoIcons.minus,
                                   color: Colors.white,
                                 ),

                               ],
                             ),
                             */

                        ),
                      ),


                    ],
                  ),

                ),
              );
              /*return ListTile(
                title: Text(snapshot.data![index]['name']), // Assuming 'name' is a field
                subtitle: Text(snapshot.data![index]['description']), // Assuming 'description' is a field
              );*/
            },
          );
        },
      ),
    );
  }
}

class SellerItem extends StatelessWidget {
  final String sellerId;
  final List<Map<String, dynamic>> categories;

  SellerItem({required this.sellerId, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Seller: $sellerId'),
      children: categories.map((category) {
        return CategoryItem(
          categoryName: category['categoryName'],
          foodItems: category['foodItems'],
        );
      }).toList(),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> foodItems;

  CategoryItem({required this.categoryName, required this.foodItems});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Category: $categoryName'),
      children: foodItems.map((foodItem) {
        return ListTile(
          title: Text(foodItem['name']),
          subtitle: Text(foodItem['description']),
        );
      }).toList(),
    );
  }
}
