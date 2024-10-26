import 'package:get/get.dart';

import '../pages/register_home.dart';
import 'Package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_kitchen/Session/session.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SellerDrawerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              accountName: Text(
                "Hello Seller",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail:Text(
                "Seller@gmail.com",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/avater.png"),
              ),
            ),
          ),

          // List tile
          ListTile(
            leading :IconButton(
              color: Colors.white,
              onPressed: (){
                Navigator.pushNamed(context,'Seller_Homepage');
              },
              icon: Icon(
                CupertinoIcons.home,
                color: Colors.red,
              ),
            ),


            /*  Icon(
               CupertinoIcons.home,
               color: Colors.red,
             ),*/
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),



          // List tile
          ListTile(
            leading :IconButton(
              color: Colors.white,
              onPressed: (){
                Navigator.pushNamed(context, 'seller_profile');
              },
              icon: Icon(
                CupertinoIcons.person,
                color: Colors.red,
              ),
            ),

            title: Text(
              "My Account",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

       /*
          // List tile
          ListTile(
            leading :IconButton(
              color: Colors.white,
              onPressed: (){
                Navigator.pushNamed(context,'CartPage');
              },
              icon: Icon(
                CupertinoIcons.cart,
                color: Colors.red,
              ),
            ),

            title: Text(
              "My Orders",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),



          // List tile
          ListTile(
            leading :IconButton(
              color: Colors.white,
              onPressed: (){
                Navigator.pushNamed(context,'homepage');
              },
              icon:Icon(
                CupertinoIcons.heart,
                color: Colors.red,
              ),
            ),

            title: Text(
              "My Wish list",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

              */


          // List tile
          ListTile(
            leading :IconButton(
              color: Colors.white,
              onPressed: (){
                Navigator.pushNamed(context,'SettingsPage');
              },
              icon:Icon(
                CupertinoIcons.settings,
                color: Colors.red,
              ),
            ),

            title: Text(
              "Settings",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // List tile
          ListTile(
            leading :IconButton(
              color: Colors.white,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(MyPrefs.sellerId);
                prefs.remove(MyPrefs.IsSetup);


                Get.offAll(RegisterHome());
               // Navigator.pushNamed(context,'/');
              },
              icon:Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
            ),

            title: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),








        ],
      ),
    );
  }
}
