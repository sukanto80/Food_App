import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Customer_Controller/cart_controller.dart';

class CustomerOrdersPage extends StatefulWidget {

  @override
  _CustomerOrdersPageState createState() => _CustomerOrdersPageState();
}

class _CustomerOrdersPageState extends State<CustomerOrdersPage> {

  List<Map<String, dynamic>> _orders = [];
  final controller = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }

  Future<void> _fetchOrders() async {
    List<Map<String, dynamic>> orders = await controller.getOrdersForCustomer();
    setState(() {
      _orders = orders;
    });
  }

  Future<List<Map<String, dynamic>>> _fetchOrderItems(String orderId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('orders')
        .doc(orderId)
        .collection('items')
        .get();

    return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: _orders.isEmpty
          ? Center(child: Text(''))
          : ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 4,
            child: ExpansionTile(
              title: Text('Order Id: ${order['foodOrderId']}'),
              subtitle: Text('Total Amount: ${order['totalAmount']} tk',style: TextStyle(color: Colors.deepPurple),),
              children: [
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: _fetchOrderItems(order['id']),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Error fetching items'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('No items found for this order.'),
                      );
                    }

                    final items = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, itemIndex) {
                        final item = items[itemIndex];
                        var order_id = item['order_id'] ;
                        print("Order Table Order ID: ${order_id}");
                        return ListTile(
                          title: Text( 'Name : ${item['order_id']} Status : ${item['status']}'),
                          subtitle: Text('Quantity: ${item['quantity']}'),
                          trailing: Text('${(item['price'] * item['quantity']).toStringAsFixed(2)} tk'),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}