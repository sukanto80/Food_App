import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_kitchen/backend/authentication/controller/signup_controller.dart';
//import 'package:home_kitchen/backend/customer/user_model.dart';

import '../Customer_Controller/customer_auth_controller.dart';
import '../backend/authentication/models/user_model.dart';
import 'login.dart';

class CustomerRegister extends StatefulWidget {
  String userType;
   CustomerRegister
      ({super.key,required this.userType});

  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {

  final controller = Get.put(CustomerAuthController());
  final _formKey = GlobalKey<FormState>();

  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {

    //backend



   /* @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          ElevatedButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(_focusNode);
            },
            child: Text("Focus Text Field"),
          ),
          TextField(
            focusNode: _focusNode,
            decoration: InputDecoration(labelText: "Enter text"),
          ),
        ],
      );
    }*/





    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/customer.png'),fit: BoxFit.cover)


      ),

      child: Scaffold(
        backgroundColor: Colors.transparent ,
        body: Stack(


          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: IconButton(
                padding: EdgeInsets.only(left:0, top:40),
                color: Colors.white,
                onPressed: (){
                 // Navigator.pushNamed(context, 'register');
                },
                icon: Icon(Icons.arrow_back, color: Colors.black,),
              ),
            ),




            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3,
                    right: 35, left: 35),
                child: Form(
                  key: _formKey, //backend


                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.fullName, //backend
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
                        controller: controller.phoneNo, //backend
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
                        controller: controller.email,
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
                        controller: controller.password,
                        decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            hintText: 'Password',
                            border: OutlineInputBorder(


                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,


                        children:[
                          TextButton(onPressed: (){
                            Get.to(()=>MyLogin(userType: widget.userType,));
                            //Navigator.pushNamed(context, 'login');
                          }, child: Text('Already Have an Account?',style: TextStyle(
                              decoration: TextDecoration.underline, fontSize: 21,
                              color: Colors.deepOrange
                          )) ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
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
                                      controller.createCustomerAccount(widget.userType);

                                      /*final user = UserModel(
                                        email: controller.email.text.trim(),
                                        password: controller.password.text.trim(),
                                        fullName: controller.fullName.text.trim(),
                                        phoneNo: controller.phoneNo.text.trim(),
                                      );

                                      await SignUpController.instance.createUser(user);
                                      Navigator.pushNamed(context, 'homepage');
                                      // Email authentication
                                      await SignUpController.instance.registerUser(
                                        controller.email.text.trim(),
                                        controller.password.text.trim(),
                                        controller.fullName.text.trim(),
                                        controller.phoneNo.text.trim(),

                                      );*/
                                      // Navigate to homepage after successful sign-up
                                    //  Navigator.pushNamed(context, 'homepage');
                                    }
                                  } ,






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