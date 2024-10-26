


// Function to display the address dialog
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Customer_Controller/cart_controller.dart';

// Function to display the address dialog
void showAddressDialog(BuildContext context) {
  final _addressController = TextEditingController();
  final controller = Get.put(CartController());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter Address'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter your full address',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5, // Allows multiple lines of input
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle the entered address here
              String address = _addressController.text;

              print('Address: $address');

              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Submit'),
          ),
        ],
      );
    },
  );
}
