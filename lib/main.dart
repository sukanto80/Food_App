import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:home_kitchen/backend/repository/authentication_repository/authentication_repository.dart';
import 'package:home_kitchen/pages/Admin_login.dart';
import 'package:home_kitchen/pages/Delivery_login.dart';
import 'package:home_kitchen/pages/delivery_address.dart';
import 'package:home_kitchen/pages/edit_profile.dart';
import 'package:home_kitchen/pages/payment_system.dart';
import 'package:home_kitchen/pages/profile.dart';
import 'package:provider/provider.dart';

import 'Admin Pages/providers/menu_item_provider.dart';
import 'Admin Pages/providers/order_provider.dart';
import 'Admin Pages/providers/restaurant_provider.dart';
import 'Admin Pages/providers/user_provider.dart';
import 'Admin Pages/screens/admin_page.dart';
import 'Admin Pages/screens/seller_all_product.dart';
import 'Package:flutter/material.dart';

import 'package:home_kitchen/Delivery%20Pages/SettingsPage.dart';
import 'package:home_kitchen/Delivery%20Pages/ViewProfilePage.dart';
import 'package:home_kitchen/Delivery%20Pages/delivery_home_page.dart';
import 'package:home_kitchen/Delivery%20Pages/UpdateDeliveryStatusPage.dart';
import 'package:home_kitchen/Delivery%20Pages/view_pending_deliveries.dart';
import 'package:home_kitchen/pages/AddLocationPage.dart';
import 'package:home_kitchen/pages/Admin_register.dart';
import 'package:home_kitchen/pages/CartPage.dart';
import 'package:home_kitchen/pages/Homepage.dart';
import 'package:home_kitchen/pages/Splashscreen.dart';
import 'package:home_kitchen/pages/category.dart';
import 'package:home_kitchen/pages/customer_register.dart';

import 'package:home_kitchen/pages/delivery_register.dart';
import 'package:home_kitchen/pages/forgot_password.dart';
import 'package:home_kitchen/pages/login.dart';
import 'package:home_kitchen/pages/register_home.dart';
import 'package:home_kitchen/pages/seller_register.dart';

import 'Seller Page/Controller/upload_product_controller.dart';
import 'Seller Page/Seller_profile.dart';
import 'Seller Page/all_product_show.dart';
import 'Seller Page/product_list.dart';
import 'Seller Page/seller_homepage.dart';
import 'Seller Page/upload_product_form.dart';
import 'Widgets/DrawerWidget.dart';
import 'backend/authentication/controller/profile_controler.dart';
import 'backend/repository/user_repository/user_repository.dart';
import 'package:firebase_core/firebase_core.dart';

//499B
//import 'package:cloud_firestore/cloud_firestore.dart';

 //comment out

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 await Hive.openBox('AccountInformation');

 try {
   await Firebase.initializeApp(
       options:const FirebaseOptions
         (apiKey:"AIzaSyDSJcaGhKvNnicb8cyBDVV2lMdTPTcwhcQ",
         appId: "1:494394386361:android:348c24bd9a8bc1b3fbb868",
         messagingSenderId: "494394386361",
         projectId: "food-app-4ce84",
         storageBucket: "gs://food-app-4ce84.appspot.com",
       ));
   print("Firebase is connected!");
   runApp(MyApp());

 } catch (e) {
   print("Failed to connect to Firebase: $e");
 }

/*
 Get.put(AuthenticationRepository());
 Get.put(UserRepository());*/
}
/*
void main() {
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp(options: DefaltFirebaseOptions.currentPlatform)
       .then((value) => Get.put(AuthenticationRepository()));
  runApp(MyApp(),);
}
*/
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(UploadProductController());
    Get.lazyPut(() => UploadProductController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );

  }
}
