import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_kitchen/backend/repository/authentication_repository/authentication_repository.dart';
import 'package:home_kitchen/backend/repository/user_repository/Admin_repository.dart';
import 'package:home_kitchen/backend/repository/user_repository/user_repository.dart';
import '../../repository/user_repository/Delivery_repository.dart';
import '../../repository/user_repository/Seller_repository.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // TextField Controllers for user input
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final nid = TextEditingController();

  final userRepo = Get.put(UserRepository());
  final adminRepo = Get.put(AdminRepository());
  final deliveryRepo = Get.put(DeliveryRepository());
  final sellerRepo = Get.put(SellerRepository());

  // Register user with Firebase Authentication and create user in Firestore
  Future<bool> registerUser(String email, String password, String fullName, String phoneNo) async {
    try {
      // Step 1: Register the user using Firebase Authentication
     final userCredential =  await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);

      // Step 2: Create user model for Firestore
      UserModel user = UserModel(

        email: email,
        fullName: fullName,
        phoneNo: phoneNo,
        password: '', // Password should not be saved directly in Firestore
      );

      // Step 3: Save user in Firestore
      await createUser(user);

      return true; // Successfully registered and user created
    } catch (e) {
      print("Error during registration: $e");
      Get.snackbar("Registration Error", "Failed to register user");
      return false; // Registration failed
    }
  }

  // Create a user in Firestore
  Future<void> createUser(UserModel user) async {
    try {
      await userRepo.createUser(user);
      print('User created in Firestore');
    } catch (e) {
      print("Error creating user in Firestore: $e");
      Get.snackbar("Error", "Failed to create user in Firestore");
    }
  }

  // Create an admin in Firestore
  Future<void> createAdmin(UserModel user) async {
    try {
      await adminRepo.createAdmin(user);
      print('Admin created in Firestore');
    } catch (e) {
      print("Error creating admin in Firestore: $e");
      Get.snackbar("Error", "Failed to create admin in Firestore");
    }
  }

  // Create a delivery person in Firestore
  Future<void> createDelivery(UserModel user) async {
    try {
      await deliveryRepo.createDelivery(user);
      print('Delivery person created in Firestore');
    } catch (e) {
      print("Error creating delivery person in Firestore: $e");
      Get.snackbar("Error", "Failed to create delivery person in Firestore");
    }
  }

  // Create a seller in Firestore
  Future<void> createSeller(UserModel user) async {
    try {
      await sellerRepo.createSeller(user);
      print('Seller created in Firestore');
    } catch (e) {
      print("Error creating seller in Firestore: $e");
      Get.snackbar("Error", "Failed to create seller in Firestore");
    }
  }
}






























/*
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_kitchen/backend/repository/authentication_repository/authentication_repository.dart';
import 'package:home_kitchen/backend/repository/user_repository/Admin_repository.dart';
import 'package:home_kitchen/backend/repository/user_repository/user_repository.dart';
import '../../repository/user_repository/Delivery_repository.dart';
import '../../repository/user_repository/Seller_repository.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // TextField Controllers for user input
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final nid = TextEditingController();

  final userRepo = Get.put(UserRepository());
  final adminRepo = Get.put(AdminRepository());
  final deliveryRepo = Get.put(DeliveryRepository());
  final sellerRepo = Get.put(SellerRepository());

  // Register user with required parameters
  Future<void> registerUser(String email, String password, String fullName, String phoneNo) async {
    try {
      // Call the authentication method to create user
      await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);

      // Create user model
      UserModel user = UserModel(
        email: email,
        fullName: fullName,
        phoneNo: phoneNo, password: '',
        // Add additional fields if necessary
      );

      // Create the user in the database
      await createUser(user);
    } catch (e) {
      print("Error during registration: $e");
      Get.snackbar("Error", "Failed to register user");
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    print('User created');
  }

  Future<void> createAdmin(UserModel user) async {
    await adminRepo.createAdmin(user);
  }

  Future<void> createDelivery(UserModel user) async {
    await deliveryRepo.createDelivery(user);
  }

  Future<void> createSeller(UserModel user) async {
    await sellerRepo.createSeller(user);
  }
}

 */

/*

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_kitchen/backend/repository/authentication_repository/authentication_repository.dart';
import 'package:home_kitchen/backend/repository/user_repository/Admin_repository.dart';
import 'package:home_kitchen/backend/repository/user_repository/user_repository.dart';

import '../../repository/user_repository/Delivery_repository.dart';
import '../../repository/user_repository/Seller_repository.dart';
import '../models/user_model.dart';

class SignUpController extends GetxController{
  static  SignUpController get instance => Get.find();

  // TextField Controller to get data from textfields

  final email = TextEditingController() ;
  final password = TextEditingController() ;
  final fullName = TextEditingController() ;
  final phoneNo = TextEditingController() ;
  final nid = TextEditingController() ;
  final userRepo = Get.put(UserRepository());
  final adminRepo = Get.put(AdminRepository());
  final deliveryRepo = Get.put(DeliveryRepository());
  final sellerRepo = Get.put(SellerRepository());

  // call the function from Design & it will do  the rest

   registerUser(String email , String password ) {
    String? error =
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password)
    as String?;
    if (error!= null){
      Get.showSnackbar(GetSnackBar(message:error.toString()));
    }
  }

   createUser(UserModel user){
    userRepo.createUser(user);
  }

  createAdmin(UserModel user) {
    adminRepo.createAdmin(user);
  }
  createDelivery(UserModel user) {
    deliveryRepo.createDelivery(user);
  }

  createSeller(UserModel user) {
    sellerRepo.createSeller(user);
  }


}

 */





