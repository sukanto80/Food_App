



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CustomerFoodGetController extends GetxController {

  static CustomerFoodGetController get instance => Get.find();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> unapprovedFoodItems = [] ;
  var isLoading = false.obs;
  var wishListLoader = false.obs;
  RxList approvedFoodItems = [].obs;
  List<Map<String, dynamic>> popularFood = [];
  List<Map<String, dynamic>> wishListFood = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchApprovedFoodItems();
    fetchPopularFood();
    fetchWishListFood();

  }

  Future<void> fetchApprovedFoodItems() async {
    isLoading.value = true;
    approvedFoodItems.clear();
    update();
    try {


      QuerySnapshot foodItemsSnapshot = await FirebaseFirestore.instance
          .collection('foodItems')
          .where('approved', isEqualTo: true)
          .get();

      for (var foodItemDoc in foodItemsSnapshot.docs) {
        String foodItemId = foodItemDoc.id;
        approvedFoodItems.add({
          'sellerId': foodItemDoc['seller_id'],
          'categoryId': foodItemDoc['category_id'],
          'foodId': foodItemId,
          'name': foodItemDoc['name'],
          'description': foodItemDoc['description'],
          'price': foodItemDoc['price'],
          'image': foodItemDoc['image'],
          'ratingBar': foodItemDoc['ratingBar'],
          'approved':foodItemDoc['approved'],
          'wish_list':foodItemDoc['wish_list'],
          'popular':foodItemDoc['popular'],
        });

      }
    } catch (e) {
      print('Error retrieving unapproved food items: $e');
    } finally {

        isLoading.value = false;
        update();// Update loading state

    }
  }

  Future<void> updateRating(String id,double value) async {


    await firestore
        .collection('foodItems').doc(id)
        .update({'ratingBar': value}).whenComplete(()
    {

      fetchApprovedFoodItems();

    }


    );



  }

  Future<void> updateWishList(String id,bool value) async {


    await firestore
        .collection('foodItems').doc(id)
        .update({'wish_list': value}).whenComplete(()
    {

      fetchApprovedFoodItems();
      fetchWishListFood();

    }


    );



  }

  Future<List<Map<String, dynamic>>> fetchPopularFood() async {
    List<Map<String, dynamic>> allPopularItems = [];
    try {


      QuerySnapshot foodItemsSnapshot = await FirebaseFirestore.instance
          .collection('foodItems')
          .where('popular', isEqualTo: true)
          .get();

      for (var foodItemDoc in foodItemsSnapshot.docs) {
        String foodItemId = foodItemDoc.id;
        allPopularItems.add({
          'sellerId': foodItemDoc['seller_id'],
          'categoryId': foodItemDoc['category_id'],
          'foodId': foodItemId,
          'name': foodItemDoc['name'],
          'description': foodItemDoc['description'],
          'price': foodItemDoc['price'],
          'image': foodItemDoc['image'],
          'ratingBar': foodItemDoc['ratingBar'],
          'approved':foodItemDoc['approved'],
          'wish_list':foodItemDoc['wish_list'],
          'popular':foodItemDoc['popular'],
        });

      }
    } catch (e) {
      print('Error retrieving unapproved food items: $e');
    } finally {

      isLoading.value = false; // Update loading state

    }
    return allPopularItems;
  }

  UpdatePopularFood(String foodId) async {
    await firestore
        .collection('foodItems').doc(foodId)
        .update({'popular': true});


  }


  Future<void> fetchWishListFood() async {
    wishListLoader.value=true;
    update();

    wishListFood.clear();
    try {


      QuerySnapshot foodItemsSnapshot = await FirebaseFirestore.instance
          .collection('foodItems')
          .where('wish_list', isEqualTo: true)
          .get();

      for (var foodItemDoc in foodItemsSnapshot.docs) {
        String foodItemId = foodItemDoc.id;
        wishListFood.add({
          'sellerId': foodItemDoc['seller_id'],
          'categoryId': foodItemDoc['category_id'],
          'foodId': foodItemId,
          'name': foodItemDoc['name'],
          'description': foodItemDoc['description'],
          'price': foodItemDoc['price'],
          'image': foodItemDoc['image'],
          'ratingBar': foodItemDoc['ratingBar'],
          'approved':foodItemDoc['approved'],
          'wish_list':foodItemDoc['wish_list'],
          'popular':foodItemDoc['popular'],
        });

      }
    } catch (e) {
      print('Error retrieving unapproved food items: $e');
    } finally {
      wishListLoader.value=false;
      update();


    }

  }



}

class PopularFoodItem {
  final String foodId;
  final String sellerId;
  final String customerId;
  final String foodName;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;
  final int ratingBar;
  final bool approved;
  final bool wish_list;
  final bool popular;

  PopularFoodItem({
    required this.foodId,
    required this.foodName,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.sellerId,
    required this.customerId,
    required this.ratingBar,
    required this.approved,
    required this.wish_list,
    required this.popular

  });

  factory PopularFoodItem.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PopularFoodItem(
      foodId: data['foodId'],
      foodName: data['productName'],
      description: data['description'],
      price: data['price'],
      quantity: data['quantity'],
      imageUrl: data['imageUrl'],
      sellerId: data['sellerId'],
      customerId:  data['customerId'],
      ratingBar:  data['customerId'],
      approved:  data['customerId'],
      wish_list:  data['customerId'],
      popular:  data['customerId'],
    );
  }


}