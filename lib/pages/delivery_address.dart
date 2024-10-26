import 'package:flutter/material.dart';

import '../Widgets/container_button_model.dart';


class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Delivery Address"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                children:[
                  SizedBox(height: 40,),
                  TextFormField(
                    decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name'
                    ) ,
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile Number'
                    ) ,
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Area'
                    ) ,
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Block'
                    ) ,
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Road'
                    ) ,
                  ),
                  SizedBox(height: 25,),
                  TextFormField(
                    decoration:InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Apartment Number'
                    ) ,
                  ),
                  SizedBox(height: 35),
                  ContainerButtonModel(itext: "Save Address",
                    containerWidth: MediaQuery.of(context).size.width,
                    bgColor: Color(0xFFDB3022),
                  )

                ]
            ),
          ),
        ),
      ),
    );
  }
}
