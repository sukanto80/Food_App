import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_kitchen/pages/seller_register.dart';

import 'customer_register.dart';
import 'delivery_register.dart';
import 'login.dart';


class RegisterHome extends StatefulWidget {
  const RegisterHome ({Key? key}) : super(key: key);


  @override
  _RegisterHomeState createState() => _RegisterHomeState();
}


class _RegisterHomeState extends State<RegisterHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/update_login.png'),fit: BoxFit.cover)


      ),
      child: Scaffold(
        backgroundColor: Colors.transparent ,
        body: Stack(
          children: [
            //Container(
            //padding: EdgeInsets.only(left:75, top:125) ,
            //child: Text('Create an\nAccount',
            //style: TextStyle(color: Colors.black, fontSize:55,
            // fontWeight: FontWeight.bold),),
            // ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3,
                    right: 35, left: 35),
                child: Column(
                  children: [
                    ElevatedButton(onPressed: (){
                      Get.to(()=>SellerRegister(userType: 'seller',));
                     // Navigator.pushNamed(context, 'seller_register');
                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent) ,


                      child: Text('Seller Account', style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.normal, color: Colors.black
                      ),),


                    ),
                    SizedBox(
                      height: 55,
                    ),
                    ElevatedButton(onPressed: (){
                     // Get.to(()=>CustomerRegister(userType: 'customer',));
                     // Navigator.pushNamed(context, 'customer_register');
                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent) ,


                      child: Text('Customer Account', style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.normal, color: Colors.white
                      ),),


                    ),
                    SizedBox(
                      height: 55,
                    ),
                    ElevatedButton(onPressed: (){
                     // Get.to(()=>DeliveryRegister(userType: 'delivery',));
                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent) ,


                      child: Text('Delivery Support', style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.normal, color: Colors.black
                      ),),


                    ),

                    SizedBox(
                      height: 55,
                    ),
                    ElevatedButton(onPressed: (){
                      Get.to(()=>MyLogin(userType: 'admin',));
                     // Navigator.pushNamed(context, 'Admin');
                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.white) ,


                      child: Text('Admin', style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.normal, color: Colors.black
                      ),),


                    ),






                    SizedBox(
                      height: 60,
                    ),
                   /* Row(
                      mainAxisAlignment: MainAxisAlignment.center,


                      children:[
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, 'login');
                        },
                            child: Text('Already Have an Account?',style: TextStyle(
                          decoration: TextDecoration.underline, fontSize: 25,
                          color: Colors.black,
                        )) ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  */

                  ],


                ),


              ),
            )
          ],
        ),
      ),
    );
  }
}
