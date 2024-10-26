import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class adimLogin extends StatefulWidget {
  const adimLogin ({Key? key}) : super(key: key);


  @override
  _State createState() => _State();
}


class _State extends State<adimLogin> {
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
              padding: EdgeInsets.only(left:55, top:220) ,
              child: Text('Welcome Back!',
                style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 35,
                    fontWeight: FontWeight.normal),   ),


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
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Colors.orange.shade300,
                          filled: true,
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,


                      children:[
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, 'forgot_password');
                        }, child: Text('Forgot Password?',style: TextStyle(
                            decoration: TextDecoration.underline, fontSize: 25,
                            color: Colors.deepOrange
                        )) ),
                      ],
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.deepOrange,
                            child: IconButton(
                              color: Colors.white,
                              onPressed: (){
                                Navigator.pushNamed(context,'admin_homepage');
                              },
                              icon: Icon(Icons.arrow_forward),
                            ),
                          )


                        ]
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
