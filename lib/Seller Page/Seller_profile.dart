import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../Widgets/container_button_model.dart';

class SellerProfile extends StatefulWidget {
  const SellerProfile({super.key});

  @override
  State<SellerProfile> createState() => _MyProfileState();
}
class _MyProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40,),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/avater.png'),
            ),
            SizedBox(height: 20,),
            itemProfile('Name', 'Hello Seller', CupertinoIcons.person),
            SizedBox(height: 15,),
            itemProfile('Phone Number', '017xxxxxx51', CupertinoIcons.phone),
            SizedBox(height: 15,),
            itemProfile('location', 'Bashundhara R/A city', CupertinoIcons.location_circle),
            SizedBox(height: 15,),
            itemProfile('Email', 'Seller@gmail.com', CupertinoIcons.mail),
            SizedBox(height: 15,),
            itemProfile('Log Out', '', CupertinoIcons.escape),
            const SizedBox(height: 30,),
            InkWell(
              onTap: () {
                // Navigator.pushNamed(context, 'profile');
                Navigator.pushNamed(context,'/');
              },
              child: ContainerButtonModel(
                itext: "Edit Profile",
                bgColor: Color(0xFFDB3022),

              ),
            ),
          ],
        ),
      ),
    );
  }
  itemProfile(String title, String subtitle, IconData iconData){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.deepOrange.withOpacity(.2),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ) ,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey,),
        tileColor: Colors.white,

      ),
    );
  }
}
