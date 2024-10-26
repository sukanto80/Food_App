import 'package:flutter/material.dart';

class view_pending_deliveries extends StatelessWidget {
  final List<Map<String, dynamic>> pendingDeliveries = [
    {'id': '1', 'restaurant': 'Kitchen A', 'items': ['Khicuri', 'Beef']},
    {'id': '2', 'restaurant': 'Kitchen B', 'items': ['Chicken Roast ', 'Plain rice']},
    {'id': '3', 'restaurant': 'Kitchen C', 'items': [' Lal Shakh Bhagi', 'Dim vhuna']},
    {'id': '4', 'restaurant': 'Kitchen D', 'items': ['Rice', 'Bhorta Platter']},
    {'id': '5', 'restaurant': 'Kitchen E', 'items': ['prawn Curry', 'Rice']},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Pending Deliveries'),
      ),
      body: ListView.builder(
        itemCount: pendingDeliveries.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 4.0,
            child: ListTile(
              title: Text(
                'Delivery ${pendingDeliveries[index]['id']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Restaurant: ${pendingDeliveries[index]['restaurant']}',
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                _showDeliveryDetails(context, pendingDeliveries[index]);
              },
            ),
          );
        },
      ),
    );
  }

  void _showDeliveryDetails(BuildContext context, Map<String, dynamic> delivery) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delivery Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Delivery ID: ${delivery['id']}'),
              SizedBox(height: 8.0),
              Text('Restaurant: ${delivery['restaurant']}'),
              SizedBox(height: 8.0),
              Text('Items: ${delivery['items'].join(', ')}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

