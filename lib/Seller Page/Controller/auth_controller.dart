


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';

import '../../Admin Pages/screens/admin_page.dart';
import '../../Delivery Pages/delivery_home_page.dart';
import '../../Session/session.dart';
import '../../pages/Homepage.dart';
import '../seller_homepage.dart';

class AuthController extends GetxController {

  static AuthController get instance => Get.find();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

// TextField Controllers for user input
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  late Box box;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    box = Hive.box('AccountInformation');
  }


  // Function to create a seller account
  Future<void> createSellerAccount(String userType) async {

    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email.text.toString(),
      password: password.text.toString(),
    );

    // Save seller information to Firestore
    try {
      await firestore.collection('sellers').doc(userCredential.user!.uid).set({
        'email': userCredential.user!.email,
        'fullname' : fullName.text.toString(),
        'phone_no' : phoneNo.text.toString(),
        'created_at': Timestamp.now(),

      }).whenComplete(() {

        MyPrefs.setId(userCredential.user!.uid);
        MyPrefs.is_setup('true');
        MyPrefs.setUserType(userType);
        

        Get.snackbar(
          "Success",
          "Your account has been created.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
        Get.offAll(() => SellerHomepage());
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


  Future<void> signInWithEmailPassword(String email, String password,String userType) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        Get.snackbar(
          "Error",
          "User not found.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
      }else{
        MyPrefs.setId(userCredential.user!.uid);
        MyPrefs.is_setup('true');
        MyPrefs.setUserType(userType);



        Get.snackbar(
          "Success",
          "Your Successfully Login Your Account.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
        if(userType=='seller'){
          Get.offAll(() => SellerHomepage());
        }else if(userType=='admin'){
          Get.offAll(() => admin_page());
        }else if(userType=='customer'){
          Get.offAll(() => Homepage());
        }else if(userType=='delivery'){
          Get.offAll(() => delivery_home_page());
        }

      }

      // User successfully signed in
      print("User signed in: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException caught: ${e.code}');
      if(e.code == 'invalid-credential') {
        Get.snackbar(
          "Error",
          "Incorrect Email & password. Please try again.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          colorText: Colors.red,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "Incorrect password. Please try again.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
    } else if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "User not found. Please try again.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          colorText: Colors.red,
        );
    } else {

    }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Password are not correct.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
     // print(e);
    }
  }

}