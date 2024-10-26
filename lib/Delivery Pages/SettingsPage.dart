import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              // Add functionality to navigate to notification settings page
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
              // Add functionality to change app language
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            onTap: () {
              // Add functionality to navigate to change password page
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Add functionality to logout the user
            },
          ),
        ],
      ),
    );
  }
}
