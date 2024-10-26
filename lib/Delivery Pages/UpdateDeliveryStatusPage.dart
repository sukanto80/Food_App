import 'package:flutter/material.dart';

class UpdateDeliveryStatusPage extends StatefulWidget {
  @override
  _UpdateDeliveryStatusPageState createState() => _UpdateDeliveryStatusPageState();
}

class _UpdateDeliveryStatusPageState extends State<UpdateDeliveryStatusPage> {
  final List<Map<String, dynamic>> deliveries = [
    {'id': '1', 'restaurant': ' Kitchen A', 'status': 'Pending'},
    {'id': '2', 'restaurant': 'Kitchen  B', 'status': 'In Progress'},
    {'id': '3', 'restaurant': 'Kitchen  C', 'status': 'Pending'},
    {'id': '4', 'restaurant': 'Kitchen  D', 'status': 'Delivered'},
    {'id': '5', 'restaurant': 'Kitchen  E', 'status': 'In Progress'},
  ];

  void _updateStatus(int index, String status) {
    setState(() {
      deliveries[index]['status'] = status;
    });
    Navigator.of(context).pop();
  }

  void _showStatusOptions(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Update Status for Delivery ${deliveries[index]['id']}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              ListTile(
                leading: Icon(Icons.hourglass_empty, color: Colors.orange),
                title: Text('Pending'),
                onTap: () => _updateStatus(index, 'Pending'),
              ),
              ListTile(
                leading: Icon(Icons.delivery_dining, color: Colors.blue),
                title: Text('In Progress'),
                onTap: () => _updateStatus(index, 'In Progress'),
              ),
              ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text('Delivered'),
                onTap: () => _updateStatus(index, 'Delivered'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Update Delivery Status'),
      ),
      body: ListView.builder(
        itemCount: deliveries.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 4.0,
            child: ListTile(
              title: Text(
                'Delivery ${deliveries[index]['id']}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Restaurant: ${deliveries[index]['restaurant']}'),
              trailing: Chip(
                label: Text(
                  deliveries[index]['status'],
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: deliveries[index]['status'] == 'Pending'
                    ? Colors.orange
                    : deliveries[index]['status'] == 'In Progress'
                    ? Colors.blue
                    : Colors.green,
              ),
              onTap: () {
                _showStatusOptions(context, index);
              },
            ),
          );
        },
      ),
    );
  }
}
