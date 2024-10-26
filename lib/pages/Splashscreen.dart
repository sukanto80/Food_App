import 'dart:async';

import '../Admin Pages/screens/admin_page.dart';
import '../Delivery Pages/delivery_home_page.dart';
import '../Seller Page/seller_homepage.dart';
import '../Session/session.dart';
import 'Homepage.dart';
import 'Package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:home_kitchen/pages/register_home.dart';
import 'package:home_kitchen/pages/seller_register.dart';

class Splashscreen extends StatefulWidget {

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String ? setup;
  String? userType;


  getSetup() async {
    await MyPrefs.get_is_setup().then((value) {
      setup = value;
    });
    print(setup);
  }
  getUserType() async {
    await MyPrefs.getUserType().then((value) {
      userType = value;
    });
    print(userType);
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {

      if(setup=="true"){
        if(userType=='seller'){
          Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(
              builder: (context) => SellerHomepage()
          ));
        }else if(userType=='admin'){
          Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(
              builder: (context) => admin_page()
          ));
        }else if(userType=='customer'){
          Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(
              builder: (context) => Homepage()
          ));
        }else if(userType=='delivery'){
          Navigator.pushReplacement(context as BuildContext, MaterialPageRoute(
              builder: (context) => delivery_home_page()
          ));

        }

      }else{

      }

  }



  @override
  void initState() {
    getSetup();
    getUserType();
    startTime();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.white ,
          body: Center(
          child : Column (
           mainAxisAlignment: MainAxisAlignment.center ,
         children: [
           Image.asset(
             "images/Splash.png",
             height: 650,
           ),
           Container(
             margin: EdgeInsets.only(top: 10),
               child:Text(
                 "Buy Fresh Homemade Food",
                 style: TextStyle(
                 color:Colors.greenAccent ,
                 fontSize :25 ,
                   fontWeight: FontWeight.bold ,
                 ),
               )
           ),
          SizedBox(height: 10,),
            InkWell(
              onTap: () {
                Get.to(()=>RegisterHome());
                //Navigator.pushReplacementNamed(context, "register");
              },
                 // for animation on container
              child: Ink(
                padding: EdgeInsets.symmetric(horizontal: 80,vertical: 16),
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(30),
                  color : Colors.green ,
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ),
            ),
         ],
    ),
    ),
    );
  }
}
