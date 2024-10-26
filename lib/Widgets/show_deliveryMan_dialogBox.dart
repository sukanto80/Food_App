


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Seller Page/Controller/upload_product_controller.dart';


class showDropdownDialog extends StatefulWidget {
  String order_id,item_id;
   showDropdownDialog({required this.order_id,required this.item_id});

  @override
  State<showDropdownDialog> createState() => _showDropdownDialogState();
}

class _showDropdownDialogState extends State<showDropdownDialog> {
  final controller = Get.put(UploadProductController());
  @override
  Widget build(BuildContext context) {


      return AlertDialog(
        title: Text('Select Deliveryman'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<Map<String, dynamic>>(
              decoration: InputDecoration(
                labelText: "Select your Deliveryman",
                border: OutlineInputBorder(),
              ),
              items: controller.allDeliveryMan.map((option) {
                return DropdownMenuItem<Map<String, dynamic>>(
                  value: option,
                  child: Text(option['name']), // Display the 'name' property
                );
              }).toList(),
              onChanged: (Map<String, dynamic>? newValue) {
                setState(() {
                  controller.deliveryMan_id.value = newValue!['deliveryMan_id'];
                  print('Print delivery man id : ${controller.deliveryMan_id.value}');
                });

              },
              validator: (value) {
                if (value == null) {
                  return 'Please Select Deliveryman';
                }
                return null;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              if(controller.deliveryMan_id.value==''){
                Get.snackbar(
                  "Message",
                  "Select Deliveryman",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.white,
                  colorText: Colors.green,
                );
              }else{

              }
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.addDeliveryManId(widget.order_id,widget.item_id);
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );



  }
}



