import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Customer_Controller/all_food_controller.dart';
import '../Customer_Controller/cart_controller.dart';
import 'Package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_core/src/get_main.dart';

class NewesItemWidget extends StatefulWidget {
  String foodName,sellerId,categoryId,foodId,description,image,price;
  double ratingBar;
  bool wishList;


  NewesItemWidget({
    required this.foodName, required this.sellerId, required this.categoryId, required this.foodId,
    required this.description, required this.image,required this.price,required this.ratingBar,required this.wishList
});

  @override
  State<NewesItemWidget> createState() => _NewesItemWidgetState();
}

class _NewesItemWidgetState extends State<NewesItemWidget> {

  final controller = Get.put(CustomerFoodGetController());
  final cartController = Get.put(CartController());
  bool? value;
  double? price;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      value = widget.wishList;
      price = double.parse(widget.price) ;
      print(value);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
      child: Column(
        children: [
          // for (int i =0 ; i<=7 ; i ++)
          //iteam 1
          Padding(
              padding:EdgeInsets.symmetric(vertical: 10),
             child: Container(
               //width: 380,
               height: 180,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey.withOpacity(0.5),
                     spreadRadius: 3 ,
                     blurRadius: 10,
                     offset: Offset(0,3),
                   ),
                 ]),
               child: Row(
                 children: [
                   InkWell(
                     onTap: () {},
                     child: Container(
                       alignment: Alignment.center,
                       child: Image.network(
                         widget.image,
                           height: 180,
                         width: 150,
                       ),
                     ),
                   ),
                   Container(
                     //width: 190,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         Text(
                           widget.foodName,
                               style: TextStyle(
                                 fontSize: 22,
                                 fontWeight: FontWeight.bold,
                               ),
                         ),
                         Text(
                           widget.description,
                           style: TextStyle(
                             fontSize: 20,
                            // fontWeight: FontWeight.bold,
                           ),
                         ),
                     RatingBar.builder(
                       initialRating: widget.ratingBar,
                       //minRating: 1,
                       direction: Axis.horizontal,
                       itemCount: 5,
                       itemSize: 18,
                       itemPadding: EdgeInsets.symmetric(horizontal: 4),
                       itemBuilder: (context, _) => Icon(
                           Icons.star,
                         color: Colors.red,
                       ),
                       onRatingUpdate: (index) {
                       controller.updateRating(widget.foodId,index);

                       },
                     ),
                         Text(
                           "${widget.price} tk",
                           style: TextStyle(
                             color: Colors.red,
                             fontSize: 15,
                             fontWeight: FontWeight.bold,
                           ),
                         ),

                         /*
                         Icon(
                           Icons.favorite_border,
                           color: Colors.red,
                           size: 18,
                         ),
                         Icon(
                           CupertinoIcons.cart,
                           color: Colors.red,
                           size: 26,
                         ),
                         */
                       ],
                     ),
                   ),
                   Padding(
                       padding: EdgeInsets.symmetric(vertical: 20,horizontal: 25),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
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
                         GestureDetector(
                           onTap: (){

                             cartController.addToCart(
                               widget.foodId,
                               widget.sellerId,
                               widget.foodName,
                               widget.description, price!,
                               widget.image
                             );
                           },
                           child: Icon(
                             Icons.shopping_cart,
                             color: Colors.red,
                             size: 18,
                           ),
                         )


                       ],
                     ),
                   ),








                 ],
               )
             ),
          ),

           //item 02
          /*Padding(
            padding:EdgeInsets.symmetric(vertical: 10),
            child: Container(
                width: 380,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3 ,
                        blurRadius: 10,
                        offset: Offset(0,3),
                      ),
                    ]),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "images/DimVuna.jpg",
                          height: 180,
                          width: 150,
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            " Dim Vuna",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Taste our Dim Vuna.",
                            style: TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          RatingBar.builder(
                         initialRating: 4,
                       minRating: 1,
                       direction: Axis.horizontal,
                       itemCount: 5,
                       itemSize: 18,
                       itemPadding: EdgeInsets.symmetric(horizontal: 4),
                       itemBuilder: (context, _) => Icon(
                           Icons.star,
                         color: Colors.red,
                       ),
                       onRatingUpdate: (index) {},
                     ),
                          Text(
                            "50 tk",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 18,
                          ),
                          Icon(
                            CupertinoIcons.cart,
                            color: Colors.red,
                            size: 26,
                          ),
                        ],
                      ),
                    ),





                  ],
                )
            ),
          ),

          //item 03
          Padding(
            padding:EdgeInsets.symmetric(vertical: 10),
            child: Container(
                width: 380,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3 ,
                        blurRadius: 10,
                        offset: Offset(0,3),
                      ),
                    ]),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "images/lalshakh.jpg",
                          height: 180,
                          width: 150,
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Lal Shakh Bhaji",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Taste our Lal Shakh Bhaji.",
                            style: TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          RatingBar.builder(
                         initialRating: 4,
                       minRating: 1,
                       direction: Axis.horizontal,
                       itemCount: 5,
                       itemSize: 18,
                       itemPadding: EdgeInsets.symmetric(horizontal: 4),
                       itemBuilder: (context, _) => Icon(
                           Icons.star,
                         color: Colors.red,
                       ),
                       onRatingUpdate: (index) {},
                     ),
                          Text(
                            "50 tk",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 18,
                          ),
                          Icon(
                            CupertinoIcons.cart,
                            color: Colors.red,
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),

          //item 04
          Padding(
            padding:EdgeInsets.symmetric(vertical: 20),
            child: Container(
                width: 420,
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3 ,
                        blurRadius: 10,
                        offset: Offset(0,3),
                      ),
                    ]),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "images/Prawn-Curry.jpg",
                          height: 180,
                          width: 150,
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Prawn-Curry",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Taste our Prawn-Curry.",
                            style: TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          RatingBar.builder(
                         initialRating: 4,
                       minRating: 1,
                       direction: Axis.horizontal,
                       itemCount: 5,
                       itemSize: 18,
                       itemPadding: EdgeInsets.symmetric(horizontal: 4),
                       itemBuilder: (context, _) => Icon(
                           Icons.star,
                         color: Colors.red,
                       ),
                       onRatingUpdate: (index) {},
                     ),
                          Text(
                            "220 tk",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 18,
                          ),
                          Icon(
                            CupertinoIcons.cart,
                            color: Colors.red,
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),

          //item 05
          Padding(
            padding:EdgeInsets.symmetric(vertical: 10),
            child: Container(
                width: 380,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3 ,
                        blurRadius: 10,
                        offset: Offset(0,3),
                      ),
                    ]),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "images/bhorta.jpg",
                          height: 180,
                          width: 150,
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            " Bhorta Plater",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Taste our Bhorta Plater.",
                            style: TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          RatingBar.builder(
                         initialRating: 4,
                       minRating: 1,
                       direction: Axis.horizontal,
                       itemCount: 5,
                       itemSize: 18,
                       itemPadding: EdgeInsets.symmetric(horizontal: 4),
                       itemBuilder: (context, _) => Icon(
                           Icons.star,
                         color: Colors.red,
                       ),
                       onRatingUpdate: (index) {},
                     ),
                          Text(
                            "75 tk",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 18,
                          ),
                          Icon(
                            CupertinoIcons.cart,
                            color: Colors.red,
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),

          //iteam 06
          Padding(
            padding:EdgeInsets.symmetric(vertical: 10),
            child: Container(
                width: 380,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3 ,
                        blurRadius: 10,
                        offset: Offset(0,3),
                      ),
                    ]),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "images/Khichuri.jpg",
                          height: 180,
                          width: 150,
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Khichuri",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Taste our Khichuri.",
                            style: TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          RatingBar.builder(
                         initialRating: 4,
                       minRating: 1,
                       direction: Axis.horizontal,
                       itemCount: 5,
                       itemSize: 18,
                       itemPadding: EdgeInsets.symmetric(horizontal: 4),
                       itemBuilder: (context, _) => Icon(
                           Icons.star,
                         color: Colors.red,
                       ),
                       onRatingUpdate: (index) {},
                     ),
                          Text(
                            "100 tk",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                            size: 18,
                          ),
                          Icon(
                            CupertinoIcons.cart,
                            color: Colors.red,
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),*/



        ],  //end of first children _code by jabir


      ),
    );
  }
}
