import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../backend/authentication/controller/signup_controller.dart';
import '../backend/authentication/models/user_model.dart';


class Admin_register extends StatefulWidget {
  const Admin_register({Key? key}) : super(key: key);


  @override
  _Admin_registerState createState() => _Admin_registerState();
}


class _Admin_registerState extends State<Admin_register> {
  @override

  Widget build(BuildContext context) {

    //backend

    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();


    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login_photos.png'),fit: BoxFit.cover)


      ),
      child: Scaffold(
        backgroundColor: Colors.orange ,
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
              child: Text('Create a\nAdmin Account',
                style: TextStyle(color: Colors.white, fontSize: 35,
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
                       obscureText: true,
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
                           Navigator.pushNamed(context, 'admin_login');
                         }, child: Text('Already Have an Account?',style: TextStyle(
                           decoration: TextDecoration.underline, fontSize: 21,
                           color: Colors.black,
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
                                   final user = UserModel(
                                     email: controller.email.text.trim(),
                                     password: controller.password.text.trim(),
                                     fullName: controller.fullName.text.trim(),
                                     phoneNo: controller.phoneNo.text.trim(),
                                     //   nid: controller.nid.text.trim(),
                                   );

                                   await SignUpController.instance.createAdmin(user);
                                   Navigator.pushNamed(context, 'admin_homepage');
                                   // Email authentication
                                   await SignUpController.instance.registerUser(
                                     controller.email.text.trim(),
                                     controller.password.text.trim(),
                                     controller.fullName.text.trim(),
                                     controller.phoneNo.text.trim(),


                                   );

                                 }
                               } ,


                               //Navigator.pushNamed(context, 'admin_homepage');
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
