



import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:home_kitchen/pages/category.dart';
import 'package:image_picker/image_picker.dart';

import '../../ModelClass/food_item_model_class.dart';
import '../../Session/session.dart';
import '../all_product_show.dart';

class UploadProductController extends GetxController {

  static UploadProductController get instance => Get.find();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var orderList = [].obs;
 // late String sellerId;
  late Box box;
  Future<List<Map<String, dynamic>>>? sellersDataFuture;

  List<Map<String, dynamic>> allCategory = [];
  List<Map<String, dynamic>> allDeliveryMan = [];

  String selectedItem='Select';
  var categoryId=''.obs;
  var categoryName=''.obs;
  var deliveryMan_id=''.obs;

 // List<FoodItem> foodItems = [];
  var isLoading = false.obs;

  String ? sellerID;
  getId() async {
    await MyPrefs.getId().then((value) {
      sellerID = value;
    });
    print(sellerID);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    box = Hive.box('AccountInformation');
    getId();
    getCategory();
    getDeliveryMan();
    getSellerOrders();
   // sellerId = box.get('sellerId');
    sellersDataFuture = getAllFoodItems();
   // sellersDataFuture= getFoodItemsForSeller();

  }





  XFile? image;

  Future<String> uploadImageToStorage(String childName, File file) async{
    final FirebaseStorage storage = FirebaseStorage.instance;
    TaskSnapshot uploadTask = await FirebaseStorage.instance
        .ref(childName) // Folder path: 'images/<image.name>'
        .putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }



  Future<void> getCategory() async {

    try {
      QuerySnapshot category = await FirebaseFirestore.instance.collection('category').get();

          for (var categoryDoc in category.docs) {
            String categoryId = categoryDoc.id;
            allCategory.add({

              'categoryId': categoryId,
              'name': categoryDoc['name'],
              'image': categoryDoc['image'],

            });
          }
        }

    catch (e) {
      print('Error retrieving unapproved food items: $e');
    } finally {

        isLoading.value = false; // Update loading state

    }
  }

  // Function to add a category under the seller's account
  Future<void> addCategoryAndFoodItem( String name, String description, String price, File file,String folderPath) async {

    isLoading.value =true;
    update();

    try{


      // Function to add a food item under a specific category
      if (file != null) {
        String downloadUrl = await uploadImageToStorage(folderPath,file);
        await firestore.collection('foodItems').add({
          'seller_id': sellerID,
          'category_id': categoryId.value,
          'name': name,
          'description': description,
          'price': price,
          'image': downloadUrl,
          'popular': false,
          'wish_list':false,
          'ratingBar':0.0,
          'approved': false, // Initially set to false until approved by admin
        }).whenComplete(() {
          Get.to(() => FoodItemsScreen());
          Get.snackbar(
            "Success",
            "Your Product has been Uploaded.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: Colors.green,
          );
        }
        );
      }else{
        String downloadUrl = await uploadImageToStorage(folderPath,file);
        await firestore.collection('foodItems').add({
          'seller_id': sellerID,
          'category_id': categoryId.value,
          'name': name,
          'description': description,
          'price': price,
          'image': '',
          'approved': false, // Initially set to false until approved by admin
        }).whenComplete(() {
          Get.to(() => FoodItemsScreen());
          Get.snackbar(
            "Success",
            "Your Product has been Uploaded.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white,
            colorText: Colors.green,
          );
        }
        );

      }


    }catch(e){

    }finally{
      isLoading.value =false;
      update();
    }



    

  }



  Future<List<Map<String, dynamic>>> getAllFoodItems() async {
    List<Map<String, dynamic>> sellersData = [];

    QuerySnapshot sellersSnapshot = await FirebaseFirestore.instance.collection('sellers').get();

    for (var sellerDoc in sellersSnapshot.docs) {
      List<Map<String, dynamic>> categoriesData = [];

      QuerySnapshot categoriesSnapshot = await sellerDoc.reference.collection('categories').get();

      for (var categoryDoc in categoriesSnapshot.docs) {
        List<Map<String, dynamic>> foodItemsData = [];

        QuerySnapshot foodItemsSnapshot = await categoryDoc.reference.collection('foodItems').get();

        for (var foodItemDoc in foodItemsSnapshot.docs) {
          foodItemsData.add({
            'name': foodItemDoc['name'],
            'description': foodItemDoc['description'],
          });
        }

        categoriesData.add({
          'categoryName': categoryDoc['name'],
          'foodItems': foodItemsData,
        });
      }

      sellersData.add({
        'sellerId': sellerDoc.id,
        'categories': categoriesData,
      });
    }

    return sellersData;
  }

  Future<List<Map<String, dynamic>>> AllFoodItems() async {
    List<Map<String, dynamic>> allFoodItems = [];

    try {
      // Step 1: Fetch categories for the seller
      QuerySnapshot categorySnapshot = await FirebaseFirestore.instance
          .collection('foodItems').where('seller_id', isEqualTo: sellerID)
          .get();
      
        // Step 3: Add food items to the list
        for (var foodItemDoc in categorySnapshot.docs) {
          allFoodItems.add(foodItemDoc.data() as Map<String, dynamic>);

      }
    } catch (e) {
      print("Error fetching food items: $e");
    }

    return allFoodItems;
  }

  // Get all orders for a specific customer
  Future<void> getSellerOrders() async {
   // List<Map<String, dynamic>> sellerOrder = [];
   orderList.value.clear();


    try{
      // Fetch all orders
      final ordersSnapshot = await firestore.collection('orders').get();

      for (var orderDoc in ordersSnapshot.docs) {

        final itemsSnapshot = await orderDoc.reference.collection('items').where('sellerId', isEqualTo: sellerID).get();

        // Filter items by sellerId
        for (var itemDoc in itemsSnapshot.docs) {
          print( itemDoc['sellerId']);
          print( itemDoc['foodName']);
          print( itemDoc['price']);

          // Parse the order details and item details here
          orderList.add({
            'sellerId': itemDoc['sellerId'],
            'foodId': itemDoc['foodItemId'],
            'foodName': itemDoc['foodName'],
            'foodOrderId': itemDoc['foodOrderId'],
            'price': itemDoc['price'],
            'quantity': itemDoc['quantity'],
            'status': itemDoc['status'],
            'order_id': itemDoc['order_id'],
            'item_id': itemDoc['item_id'],
          });
          update();

        }
      }
      if (orderList.isNotEmpty) {
        print('First Order Food Name: ${orderList[0]['foodName']}');
      }
    }catch(e){
      print("Error fetching items: $e"); // Log the error for debugging
       // Return an empty list in case of an error
    }





    //return sellerOrder;
  }


  Future<void> getDeliveryMan() async {

    try {
      QuerySnapshot delivery = await FirebaseFirestore.instance.collection('delivery_man').get();

      for (var deliveryDoc in delivery.docs) {
        String deliveryManId = deliveryDoc.id;
        allDeliveryMan.add({
          'deliveryMan_id': deliveryManId,
          'name': deliveryDoc['fullname'],
        });
      }
    }

    catch (e) {
      print('Error retrieving unapproved food items: $e');
    } finally {

      isLoading.value = false; // Update loading state

    }
  }


  Future<void> UpdateDeliveryStatus(String orderId,String itemId,String status) async {

    try {
      await firestore
          .collection('orders')
          .doc(orderId)
          .collection('items')
          .doc(itemId)
          .update({'status': status}).whenComplete(() async {
            print("Click");
            await getSellerOrders();
         });
        
        
       // update({'Active': value})
    }

    catch (e) {
      print('Error retrieving unapproved food items: $e');
    } finally {

      isLoading.value = false; // Update loading state

    }
  }

  addDeliveryManId(String orderId,String itemId) async {
    try{

           await firestore
          .collection('orders')
          .doc(orderId)
          .collection('items')
          .doc(itemId).update({'deliveryMan_id':deliveryMan_id.value.toString()}).whenComplete(() {
             UpdateDeliveryStatus(orderId,itemId,'On The Way...');
             deliveryMan_id.value = '';
             update();
           });
    }catch(e){
      print("LOG : $e");
    }
  }


}







