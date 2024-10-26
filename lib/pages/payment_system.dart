import 'package:flutter/material.dart';
//import 'package:home_kitchen/container_button_model.dart';

import '../Widgets/container_button_model.dart';

class MyPayment extends StatefulWidget {
  const MyPayment({super.key});

  @override
  State<MyPayment> createState() => _MyPaymentState();
}

class _MyPaymentState extends State<MyPayment> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
    _type = e as int;
  });

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: Text("Payment system"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),

      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 40),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: _type == 1
                        ? Border.all(width: 1,color: Color(0xFFDB3022))
                        :Border.all(width: 0.3,color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(value:1, groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Color(0xFFDB3022),
                              ),
                              Text("bkash",
                                style: _type == 1? TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black):TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),

                            ],
                          ),
                          Image.asset("assets/bkash.png",
                            width: 50,
                            height: 50,
                          ),
                        ],

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: _type == 2
                        ? Border.all(width: 1,color: Color(0xFFDB3022))
                        :Border.all(width: 0.3,color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(value:2, groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Color(0xFFDB3022),
                              ),
                              Text("Credit card",
                                style: _type == 2?
                                TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black):TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),

                            ],
                          ),
                          const Spacer(),
                          Image.asset("assets/visa.png",
                            width: 40,
                          ),

                          const SizedBox(width: 8,),

                          Image.asset("assets/mastercard.png",
                            width: 45,
                          ),
                        ],

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: _type == 3
                        ? Border.all(width: 1,color: Color(0xFFDB3022))
                        :Border.all(width: 0.3,color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio(value:3, groupValue: _type,
                                onChanged: _handleRadio,
                                activeColor: Color(0xFFDB3022),
                              ),
                              Text("Nagad",
                                style: _type == 3?
                                TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black):TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey),
                              ),

                            ],
                          ),
                          Image.asset("assets/nagad.png",
                            width: 70,
                            height: 70,
                          ),
                        ],

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 150,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sub-Total", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    ) ,
                    Text(
                      "TK 300.50",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ) ,
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery charge",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ) ,
                    Text(
                      "TK 29",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ) ,
                  ],
                ),
                const Divider(height: 50,
                  color: Colors.black,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Payment", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    ) ,
                    Text(
                      "TK 329.50",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent,
                      ),
                    ) ,
                  ],
                ),
                SizedBox(height: 70,),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'address');
                  },
                  child: ContainerButtonModel(
                    itext: "Confirm Payment",
                    containerWidth: size.width,
                    bgColor: Color(0xFFDB3022),

                  ),
                ),
              ],
            ),
          ),
        ) ,

      ),
    );
  }
}
