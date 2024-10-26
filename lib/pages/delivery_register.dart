import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Delivery Pages/Controller/delivery_auth_controller.dart';
import '../backend/authentication/controller/signup_controller.dart';
import '../backend/authentication/models/user_model.dart';
import 'login.dart';


class DeliveryRegister extends StatefulWidget {
  String userType;
   DeliveryRegister({required this.userType});


  @override
  State<DeliveryRegister> createState() => _DeliveryRegisterState();
}


class _DeliveryRegisterState extends State<DeliveryRegister> {
  final controller = Get.put(DeliveryAuthController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    //backend





    return Container(

      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/delivery_image.png'),fit: BoxFit.cover)


      ),
      child: Scaffold(
        backgroundColor: Colors.green ,
        body: Stack(


          children: [

            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: IconButton(
                padding: EdgeInsets.only(left:0, top:35),
                color: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context, 'register');
                },
                icon: Icon(Icons.arrow_back,  color: Colors.black,),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left:15, top:60) ,
              child: Text('Create a\nDelivery Account',
                style: TextStyle(color: Colors.black, fontSize: 30,
                    fontWeight: FontWeight.normal),),


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
                        height: 15,
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
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.nidNo, //backend
                        decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            hintText: 'NID No.',
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
                            fillColor: Colors.white70,
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
                            fillColor: Colors.white70,
                            filled: true,
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,


                        children:[
                          TextButton(onPressed: (){
                            Get.to(()=>MyLogin(userType: widget.userType,));
                            //Navigator.pushNamed(context, 'delivery_login');
                          }, child: Text('Already Have an Account?',style: TextStyle(
                            decoration: TextDecoration.underline, fontSize: 21,
                            color: Colors.black,
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
                                    controller.createSellerAccount(widget.userType);

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
