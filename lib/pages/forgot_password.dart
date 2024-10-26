import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});


  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}


class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login3.png'),fit: BoxFit.cover)


      ),
      child: Scaffold(
        backgroundColor: Colors.transparent ,
        body: Stack(
          children: [


            Container(
              padding: EdgeInsets.only(left:70, top:240) ,
              child: Text('Forgot Password?',
                style: TextStyle(color: Colors.black, fontSize: 30,
                  fontWeight: FontWeight.normal,),   ),


            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,
                    right: 35, left: 35),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.orange.shade300,
                          filled: true,
                          hintText: 'Enter your Phone Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, 'customer_register');
                    },style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange) ,


                      child: Text('Send Code', style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.normal, color: Colors.white
                      ),),


                    ),


                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,


                      children:[
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, 'register');
                        }, child: Text('Sign Up',style: TextStyle(
                            decoration: TextDecoration.underline, fontSize: 25,
                            color: Colors.orange
                        )) ),
                      ],
                    ),
                    SizedBox(
                      height: 90,
                    ),


                  ],


                ),


              ),
            )
          ],
        ),
      ),
    );
  }
}
