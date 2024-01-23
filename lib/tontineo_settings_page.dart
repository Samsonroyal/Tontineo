import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text('Edit Profile'),
              subtitle: Column(
                children: [
                  ListTile(
                    title: Text('Group Information'),
                  ),
                  ListTile(
                    title: Text('Next of Kin'),
                  ),
                  ListTile(
                    title: Text('Personal Information/Contacts'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Security'),
              subtitle: Column(
                children: [
                  ListTile(
                    title: Text('Reset Password'),
                  ),
                  ListTile(
                    title: Text('Pin'),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Help'),
              subtitle: Column(
                children: [
                  ListTile(
                    title: Text('Contact Support'),
                  ),
                  ListTile(
                    title: Text('Privacy Policy'),
                  ),
                  ListTile(
                    title: Text('Our Website'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16), // Add a SizedBox with height 16
          Card(
            child: ListTile(
              leading: Icon(Icons.exit_to_app), // Add a leave/exit icon
              title: Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, '/login'); // Redirect to "/login" route when clicked
              },
            ),
          ),
        ],
      ),
    );
  }
}
