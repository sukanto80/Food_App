


import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Customer_Controller/cart_controller.dart';
import '../Widgets/show_deliveryMan_dialogBox.dart';
import 'Controller/upload_product_controller.dart';

class OrdersPage extends StatefulWidget {

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  List<Map<String, dynamic>> _orders = [];
  final controller = Get.put(UploadProductController());


  @override
  void initState() {
    super.initState();
    // controller.getSellerOrders();
  }


  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => UploadProductController());
    return Scaffold(
      appBar: AppBar(
        title:  Text('My Orders'),
      ),
      body:
          Obx(() {
            return SizedBox(
              //height: 600,
              child: ListView.builder(

                itemCount: controller.orderList.length,
                itemBuilder: (context, itemIndex) {
                  final item = controller.orderList[itemIndex];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                    child: Container(

                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0,3),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('FoodName : ${item['foodName']}'),
                              Text('Status : ${item['status']}')
                            ],),
                          const SizedBox(height: 10,),
                          Text('Quantity : ${item['quantity']}'),
                          const SizedBox(height: 10,),
                          Text('Total Price : ${item['quantity']*item['price']} tk'),
                          const SizedBox(height: 10,),
                          item['status']=='On The Way...'?Center(child: Text('Order Completed',
                            style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold),),)
                              : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              item['status']=='In-Process'?SizedBox(): ElevatedButton(onPressed: (){
                                controller.UpdateDeliveryStatus(item['order_id'],item['item_id'],'In-Process');
                                //controller.getSellerOrders();
                              }, child:  Text('Accept')),
                              ElevatedButton(onPressed: (){
                                if(item['status']=='Pending'){

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return  AlertDialog(
                                            title: Text('Message'),
                                            content:Text('Please first accept food order'),
                                            actions:[
                                              ElevatedButton(
                                                onPressed: () {

                                                  Navigator.of(context).pop(); // Close the dialog
                                                },
                                                child: Text('OK'),
                                              ),
                                            ]


                                        );
                                      }
                                  );



                                }else if(item['status']=='In-Process'){
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return  showDropdownDialog(order_id: item['order_id'], item_id: item['item_id'],);
                                    },
                                  );
                                }



                                //showDropdownDialog(context);
                              }, child: const Text('Select Deliveryman')),
                            ],
                          )

                        ],
                      ),


                    ),

                  );
                },
              ),
            );
          })











    );
  }
}