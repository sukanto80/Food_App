import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_kitchen/backend/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
///Store User infirebase ?
 Future<void> createUser(UserModel user) async {
    await _db.collection("Customer").doc(user.id).set(user.toJson())
        .whenComplete(
          () => Get.snackbar(
        "Success",
        "Your account has been created.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      ),
    )
        .catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        "Something went wrong. Try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      print(error.toString());
    });
  }

///step 2 - Fetch All User Or User details
Future <UserModel> getUserDetails(String email) async{
   final snapshot = await _db.collection("Customer").where("Email", isEqualTo: email).get();
   final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
   return userData;
}
 Future<List<UserModel>> allUser() async{
   final snapshot = await _db.collection("Users").get();
   final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
   return userData;
 }






}







