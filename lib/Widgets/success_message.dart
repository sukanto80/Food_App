import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_kitchen/pages/Homepage.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            SizedBox(width: 8),
            Text(
              'Success',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Text(
          'Your order has been placed successfully!',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ), backgroundColor: Colors.green,
            ),
            onPressed: () {
              Get.offAll(()=>Homepage()); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
