import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Session/session.dart';
import '../pages/register_home.dart';
import 'Controller/delivery_controller.dart';
import 'Package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class delivery_home_page extends StatefulWidget {
  const delivery_home_page({super.key});

  @override
  State<delivery_home_page> createState() => _delivery_home_pageState();
}

class _delivery_home_pageState extends State<delivery_home_page> {
  final controller = Get.put(DeliveryController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Delivery Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome, Delivery Boy!',
              style: TextStyle(fontSize: 24.0,color: Colors.white),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                // Add functionality to view pending deliveries
                Navigator.pushNamed(context, 'view_pending_deliveries');
              },
              icon: Icon(Icons.assignment),
              label: Text('View Pending Deliveries'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () {

                setState(() {
                  controller.status.value = !controller.status.value;
                  print('value change : ${controller.status.value}');
                  controller.RiderStatus(controller.status.value);
                });
                // Add functionality to view pending deliveries
                //Navigator.pushNamed(context, 'view_pending_deliveries');
              },
              icon: Icon(Icons.delivery_dining),
              label: controller.status.value?Text('Deactive',style: TextStyle(color: Colors.red),):Text('Active',style: TextStyle(color: Colors.green),),
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () {
                // Add functionality to update status of deliveries
                Navigator.pushNamed(context, 'update_delivery_Status');
              },
              icon: Icon(Icons.edit),
              label: Text('Update Delivery Status'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () {
                // Add functionality to view profile
                Navigator.pushNamed(context, 'ViewProfilePage');
              },
              icon: Icon(Icons.person),
              label: Text('View Profile'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(MyPrefs.sellerId);
                prefs.remove(MyPrefs.IsSetup);
                Get.offAll(RegisterHome());
                // Add functionality to view profile
                //Navigator.pushNamed(context, 'ViewProfilePage');
              },
              icon: Icon(Icons.person),
              label: Text('Logout'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to navigate to settings page
          Navigator.pushNamed(context, 'SettingsPage');
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}
