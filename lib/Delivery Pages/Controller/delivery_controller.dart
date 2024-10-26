





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';

import '../../Admin Pages/screens/admin_page.dart';
import '../../Session/session.dart';
import '../../pages/Homepage.dart';
import '../delivery_home_page.dart';


class DeliveryController extends GetxController {

  static DeliveryController get instance => Get.find();


  final FirebaseFirestore firestore = FirebaseFirestore.instance;

 var status = false.obs;

  String ? deliveryID;
  getId() async {
    await MyPrefs.getId().then((value) {
      deliveryID = value;
    });
    print(deliveryID);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  RiderStatus(bool value) async {
    try{
      await firestore
          .collection('delivery_man').doc(deliveryID).update({'Active': value}).whenComplete(() {
        if(value==false){
          Get.snackbar(
            "Success",
            "Now You are Deactived for delivery",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.red,
          );

        }else if(value==true){
          Get.snackbar(
            "Success",
            "Now You are active for delivery",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.green,
          );
        }

      });
    }catch(e){
      print(e);
    }



  }





}