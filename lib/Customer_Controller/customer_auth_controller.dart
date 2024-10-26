


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import '../../Admin Pages/screens/admin_page.dart';
import '../../Session/session.dart';
import '../pages/Homepage.dart';


class CustomerAuthController extends GetxController {

  static CustomerAuthController get instance => Get.find();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

// TextField Controllers for user input
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }


  // Function to create a seller account
  Future<void> createCustomerAccount(String usertype) async {

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email.text.toString(),
      password: password.text.toString(),
    );

    // Save seller information to Firestore
    try {
      await firestore.collection('customer').doc(userCredential.user!.uid).set({
        'email': userCredential.user!.email,
        'fullname' : fullName.text.toString(),
        'phone_no' : phoneNo.text.toString(),
        'created_at': Timestamp.now(),

      }).whenComplete(() {

        MyPrefs.setId(userCredential.user!.uid);
        MyPrefs.is_setup('true');
        MyPrefs.setUserType(usertype);

        Get.snackbar(
          "Success",
          "Your account has been created.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
        Get.offAll(() => Homepage());
      }
      ).catchError((error, stackTrace) {
        Get.snackbar(
          "Error",
          "Something went wrong. Try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
        print(error.toString());
      });

    }catch(e){
      print('Error adding document: $e');
    }

  }




}