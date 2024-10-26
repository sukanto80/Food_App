import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Customer_Controller/all_food_controller.dart';
import 'Package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class PopularItemWidget extends StatefulWidget {
  String foodName,sellerId,categoryId,foodId,description,image,price;
  double ratingBar;
  bool wishList;
  PopularItemWidget(
  {
    required this.foodName, required this.sellerId, required this.categoryId, required this.foodId,
    required this.description, required this.image, required this.price, required this.ratingBar, required this.wishList
  }
  );



  @override
  State<PopularItemWidget> createState() => _PopularItemWidgetState();
}

class _PopularItemWidgetState extends State<PopularItemWidget> {
  bool? value;
  final controller = Get.put(CustomerFoodGetController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      value = widget.wishList;
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 5),
      child: Row(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              width: 170,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0,3),
                  )
                ]),

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.network(
                          widget.image,
                        height: 50,
                      ),
                    ),

                    Text(
                      widget.foodName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 4,),

                    Text(
                      widget.description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),


                     SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.price} tk',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                            onTap:(){
                              setState(() {
                                value = !value!;
                                print('value change : ${value}');
                                controller.updateWishList(widget.foodId,value!);
                              });

                            },
                            child:  value!? Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 18,
                            ):Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: 18,
                            )
                        ),
                      ],
                    ),

                  ],
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
