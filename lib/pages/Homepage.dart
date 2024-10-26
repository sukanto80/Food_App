
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Customer_Controller/all_food_controller.dart';
import '../Seller Page/Controller/upload_product_controller.dart';
import '../Widgets/CategoriesWidget.dart';
import '../Widgets/DrawerWidget.dart';
import '../Widgets/NewestItemWidget.dart';
import '../Widgets/PopularItemWidget.dart';
import 'CartPage.dart';
import 'Package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Widgets/AppBarWidget.dart';

class Homepage extends StatefulWidget {


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final controller = Get.put(CustomerFoodGetController());
  final uploadProductController = Get.put(UploadProductController());
  double height =120.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Obx(
          (){
            return ListView(
              children: [
                //custom App Bar Widget
                AppBarWidget(),


                //Search
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0,3),
                          ),
                        ]),
                    child:Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.search,
                            color: Colors.red,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            child: Padding(
                                padding:EdgeInsets.symmetric(
                                  horizontal: 15 ,
                                ),
                                child : TextFormField(
                                  decoration: InputDecoration(
                                    hintText:"What would you like to have?",
                                    border: InputBorder.none,
                                  ),
                                )

                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                ),



                //Category
                Padding(

                  padding: EdgeInsets.only(top: 20,left: 10),
                  child:   ElevatedButton(

                    onPressed: () {
                      Navigator.pushNamed(context, 'categoryPage');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: Text(
                      "Category",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ),

                  /*  child:Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),  */

                ),

                //custom categories widget

                    // Display the food items
                    Container(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: uploadProductController.allCategory.length,
                          itemBuilder: (context,index){
                          var data = uploadProductController.allCategory[index];
                            return CategoriesWidget(id:data['categoryId'], name:data['name'], image: data['image'],);
                          },

                      ),
                    ),



                //CategoriesWidget(),

                //Popular Iteam

                Padding(
                  padding: EdgeInsets.only(top: 20,left: 10),
                  child:Text(
                    "Popular",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(

                  child: FutureBuilder<List<Map<String, dynamic>>>(
                          future: controller.fetchPopularFood(),
                          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {

            return Center(child: Text('No food items found.'));
            }

                 return SizedBox(
                   height: 150,
                   child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       itemCount: snapshot.data!.length,
                       itemBuilder: (context,index){
                         final foodItem = snapshot.data![index];
                         return PopularItemWidget(
                           foodName: foodItem['name'],
                           sellerId: foodItem['sellerId'],
                           categoryId: foodItem['categoryId'],
                           foodId:  foodItem['foodId'],
                           description: foodItem['description'],
                           image: foodItem['image'],
                           price: foodItem['price'],
                           ratingBar: foodItem['ratingBar'],
                           wishList: foodItem['wish_list'],
                         );
                       }
                   ),
                 );
                             }
                      )



                ),
                // Popular Iteam Widget


                //Newest Item
                Padding(
                  padding: EdgeInsets.only(top: 20,left: 10),
                  child:Text(
                    "Newest",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),


                controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                  height: 500,
                      child: ListView.builder(
                                        itemCount: controller.approvedFoodItems.length,
                                        itemBuilder: (context, index) {
                      final foodItem = controller.approvedFoodItems[index];

                      return NewesItemWidget(
                        foodName: foodItem['name'],
                        sellerId: foodItem['sellerId'],
                        categoryId: foodItem['categoryId'],
                        foodId:  foodItem['foodId'],
                        description: foodItem['description'],
                        image: foodItem['image'],
                        price: foodItem['price'],
                        ratingBar: foodItem['ratingBar'],
                        wishList: foodItem['wish_list'],
                      );
                                        },
                                      ),
                    ),
                // newest item widget
                //NewesItemWidget(),


              ],
            );
          }
      ),
      drawer : DrawerWidget(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow:[
            BoxShadow(
            color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0,3),
          ),
       ] ),
        child: FloatingActionButton(
            onPressed:() {
            Get.to(()=>CartPage());
            },
          child: Icon(
            CupertinoIcons.cart,
            size: 28,
            color: Colors.red,
          ),
          backgroundColor: Colors.black,
        ),

      ),


    );
  }
}
