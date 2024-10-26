import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Seller Page/Controller/auth_controller.dart';
import '../Seller Page/seller_homepage.dart';
import '../backend/authentication/controller/signup_controller.dart';
import '../backend/authentication/models/user_model.dart';
import 'login.dart';


class SellerRegister extends StatefulWidget {
  String userType;
   SellerRegister({Key? key,required this.userType}) : super(key: key);


  @override
  _SellerRegisterState createState() => _SellerRegisterState();
}


class _SellerRegisterState extends State<SellerRegister> {
  final controller = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    //backend

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login_photos.png'),fit: BoxFit.cover)


      ),
      child: Scaffold(
        backgroundColor: Colors.transparent ,
        body: Stack(


          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: IconButton(
                padding: EdgeInsets.only(left:0, top:20),
                color: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context, 'register');
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),


            Container(
              padding: EdgeInsets.only(left:15, top:60) ,
              child: Text('Create a\nSeller Account',
                style: TextStyle(color: Colors.redAccent, fontSize: 35,
                    fontWeight: FontWeight.normal),),


            ),


            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,
                    right: 35, left: 35),
                child: Form(
                  key: _formKey, //backend
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.fullName, //backend
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Full Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.phoneNo, //backend

                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Phone Number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.email, //backend
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Email Address',
                            border: OutlineInputBorder(


                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.password, //backend
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Password',
                            border: OutlineInputBorder(


                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,


                        children:[
                          TextButton(onPressed: (){
                            Get.to(()=>MyLogin(userType: widget.userType,));
                           // Navigator.pushNamed(context, 'login');
                          }, child: Text('Already Have an Account?',style: TextStyle(
                              decoration: TextDecoration.underline, fontSize: 21,
                              color: Colors.deepOrangeAccent
                          )) ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                               CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.deepOrange,
                                child: IconButton(
                                  color: Colors.white,
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {

                                      controller.createSellerAccount(widget.userType);



                                    }
                                  } ,



                                  // Navigator.pushNamed(context,'Seller_Homepage');

                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ),

                          ]
                      ),


                    ],


                  ),

                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
