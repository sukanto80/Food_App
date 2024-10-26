import 'package:flutter/material.dart';

class ViewProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             CircleAvatar(
               radius: 50,
              backgroundImage: AssetImage("images/avater.png"),
            ),
            SizedBox(height: 20),
            Text(
              'Liton Das',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Delivery Boy',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text(
                    'liton@gmail.com',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold ,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                    '01722233350',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold ,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

