



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FoodManagementController extends GetxController {

  static FoodManagementController get instance => Get.find();


  List<Map<String, dynamic>> unapprovedFoodItems = [] ;
  var isLoading = false.obs;


}