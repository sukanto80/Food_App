

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:home_kitchen/backend/authentication/controller/profile_controler.dart';


import '../Widgets/container_button_model.dart';
import '../backend/authentication/models/user_model.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}
class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(100),
          child: FutureBuilder (
            future: controller.getUserData() ,
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.done ){
                if(snapshot.hasData){
                  UserModel userData = snapshot.data as UserModel;
                  return Column(  /// step 4 -wrap this widget with FutureBuilder
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),child: const Image(image: AssetImage('images/avater.png')),)
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width:35,
                              height:35,
                              decoration:BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.red),

                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50 ),
                      Form(child:Column(
                        children: [
                          TextFormField(
                            initialValue: userData.fullName,

                            decoration: InputDecoration(
                                fillColor: Colors.white70,
                                filled: true,
                                hintText: 'Full Name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(

                            obscureText: true,
                            initialValue: userData.phoneNo,
                            decoration: InputDecoration(
                                fillColor: Colors.white70,
                                filled: true,
                                hintText: 'Phone Number',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            initialValue: userData.email,

                            decoration: InputDecoration(
                                fillColor: Colors.white70,
                                filled: true,
                                hintText: 'Email Address',
                                border: OutlineInputBorder(


                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            initialValue: userData.password,
                            decoration: InputDecoration(
                                fillColor: Colors.white70,
                                filled: true,
                                hintText: 'Password',
                                border: OutlineInputBorder(


                                    borderRadius: BorderRadius.circular(10)
                                )
                            ),
                          ),
                          const SizedBox(height: 30,),
                          InkWell(
                            onTap: () {
                              // Navigator.pushNamed(context, 'profile');
                              Navigator.pushNamed(context,'editprofile');
                            },
                            child: ContainerButtonModel(
                              itext: "Edit Profile",
                              bgColor: Color(0xFFDB3022),

                            ),
                          ),

                        ],

                      ))







                    ],
                  );
                } else if (snapshot.hasError){
                  return Center( child: Text(snapshot.error.toString()) );
              } else {
                  return const Center (child: Text ('Something went wrong'));
              }

              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },

          ),
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












