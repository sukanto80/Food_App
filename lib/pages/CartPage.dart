import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Customer_Controller/cart_controller.dart';
import '../Widgets/CartBottomNavBar.dart';
import 'Package:flutter/material.dart';
import 'package:home_kitchen/Widgets/AppBarWidget.dart';
import 'package:home_kitchen/Widgets/DrawerWidget.dart';
class CartPage extends StatefulWidget {
   CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final controller = Get.put(CartController());
  final addressController = TextEditingController();
  var totalAmount= 0.0;
  var totalItems= 0;


  /// Function to get the total number of items in the cart
  int getCartItemCount(List<CartItem> cartItems) {
    return cartItems.length;
  }

  /// Function to calculate the total amount of the cart
  double getCartTotalAmount(List<CartItem> cartItems) {
    return cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
             ListView(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppBarWidget(),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20 ,
                              left: 10,
                              bottom: 10,
                            ),
                            child: Text(
                              "Order List",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold ,
                              ),
                            ),
                          ),
                          //item 01
                          StreamBuilder<List<CartItem>>(
                              stream: controller.getCartItems(),
                              builder: (context,snapshot){
                                if(!snapshot.hasData){
                                  return Center(child: CircularProgressIndicator());
                                }
                                final cartItems = snapshot.data!;
                                print("Cart Length : ${cartItems.length}");
                                totalItems = getCartItemCount(cartItems);
                                totalAmount = getCartTotalAmount(cartItems);



                               /* for( int i=0;i<cartItems.length;i++){

                                  totalAmount+=cartItems[i].price * cartItems[i].quantity;
                                  totalItems = cartItems.length;
                                }
                                print("Total Amount : ${totalAmount}");
                                print("Total item : ${totalItems}");*/

                                return Column(
                                  children: [
                                  SizedBox(
                                  height: 300,
                                  child: ListView.builder(
                                    itemCount: cartItems.length,
                                    itemBuilder: (BuildContext context, int index) {


                                      final cartItem = cartItems[index];


                                      return CartItemWidget(
                                        imageUrl: cartItem.imageUrl,
                                        name: cartItem.productName,
                                        description: cartItem.description,
                                        price: cartItem.price,
                                        sellerId: cartItem.sellerId,
                                        foodId: cartItem.productId,
                                        customerId: cartItem.customerId,
                                        quantity: cartItem.quantity,
                                      );
                                    },),
                                ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
                                      child: Container(
                                        padding: EdgeInsets.all(20),
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
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:EdgeInsets.symmetric(
                                                vertical:10,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Items:",
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                  Text(
                                                    "$totalItems",
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black,
                                            ),

                                            Padding(
                                              padding:EdgeInsets.symmetric(
                                                vertical:10,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Sub-Total:",
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                  Text(
                                                    "$totalAmount tk",
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Divider(
                                              color: Colors.black,
                                            ),

                                            Padding(
                                              padding:EdgeInsets.symmetric(
                                                vertical:10,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Delivery:",
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                  Text(
                                                    "60 tk",
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            Divider(
                                              color: Colors.black,
                                            ),

                                            Padding(
                                              padding:EdgeInsets.symmetric(
                                                vertical:10,
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Total:",
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                  Text(
                                                    totalAmount==0.0?"${totalAmount} tk":"${totalAmount+60} tk",
                                                    style: TextStyle(fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),


                                      ),

                                    ),
                                    TextFormField(
                                      controller: addressController,
                                      decoration: InputDecoration(
                                        labelText: 'Address',
                                        hintText: 'Enter your full address',
                                        border: OutlineInputBorder(),
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3, // Allows multiple lines of input
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
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
                                        ],
                                      ),

                                      padding: EdgeInsets.symmetric(horizontal: 15) ,
                                      height: 80,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [

                                              Text(
                                                "Total:",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              SizedBox(
                                                width:15,
                                              ),
                                              Text(
                                                totalAmount==0.0?"${totalAmount} tk":"${totalAmount+60} tk",
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                ),

                                              ),

                                            ],
                                          ),
                                          ElevatedButton(

                                            onPressed: () {
                                              if(addressController.text.isNotEmpty){
                                                controller.createOrder(cartItems,totalAmount,totalItems,addressController.text.toString(),context);
                                              }else{
                                                Get.snackbar(
                                                  "Error",
                                                  "Please enter your address",
                                                  snackPosition: SnackPosition.TOP,
                                                  backgroundColor: Colors.red,
                                                  colorText: Colors.white,
                                                );
                                              }

                                             // Navigator.pushNamed(context,'payment');

                                            },
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all(Colors.green),
                                            ),
                                            child: Text(
                                              "Order Now",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),

                                            ),
                                          ),

                                        ],
                                      ),


                                    ),
                                    SizedBox(height: 10,)
                                  ],
                                );


                              }
                          )

                        ]
                    ),
                  ),

                ),
















              ],
            ),




     drawer: DrawerWidget(),

     // bottomNavigationBar: CartBottomNavBar(),

    );
  }
}

class CartItemWidget extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String foodId;
  final String sellerId;
  final String customerId;
  final String description;
  final double price;
  final int quantity;

  CartItemWidget({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.sellerId,
    required this.foodId,
    required this.customerId,
    required this.quantity,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CartController());
    return Padding(
      padding:EdgeInsets.symmetric(vertical: 9),
      child: Container(
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
                widget.imageUrl,
                height: 80,
                width: 100,
              ),
            ),
            Container(
              width: 190,
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize:20,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${widget.price} Tk",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize:16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

              Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                  width: 35,
                  child: OutlinedButton(
                    onPressed: () {
                      if (widget.quantity > 0) {
                        controller.updateCartQuantity(widget.foodId, widget.quantity - 1);
                      }
                    },
                    child: Icon(Icons.remove, color: Colors.black,size: 20,),
                    style: OutlinedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(8),
                      side: BorderSide(color: Colors.black),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(

                      '${widget.quantity}'
                  ),
                ),
                SizedBox(
                  height: 35,
                  width: 35,
                  child: OutlinedButton(
                    onPressed: () {
                      controller.addToCart(
                        widget.foodId,
                        widget.sellerId,
                        widget.name,
                        widget.description,
                        widget.price,
                        widget.imageUrl
                      );
                    },
                    child: Icon(Icons.add, color: Colors.black,size: 20,),
                    style: OutlinedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(8),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),






                ]
              ),
            ),




        );
  }
}
