




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../Customer_Controller/all_food_controller.dart';
import '../Widgets/NewestItemWidget.dart';

class WishListFood extends StatefulWidget {
  const WishListFood({super.key});

  @override
  State<WishListFood> createState() => _WishListFoodState();
}

class _WishListFoodState extends State<WishListFood> {
  final controller = Get.put(CustomerFoodGetController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchWishListFood();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       /* leading: GestureDetector(
          onTap: (){
            controller.fetchApprovedFoodItems();
            controller.fetchPopularFood();
            Get.back();
          },
            child: Icon(Icons.arrow_back_ios)),*/
        title: Text('Wish List'),
      ),
      body:

          Obx(
            (){
              return  controller.wishListLoader.value?Center(child: CircularProgressIndicator(),): ListView.builder(
                itemCount: controller.wishListFood.length,
                itemBuilder: (context, index) {
                  final foodItem = controller.wishListFood[index];

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
              );
            }

          ),
    );
  }
}
