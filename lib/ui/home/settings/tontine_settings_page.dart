import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Card(
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
          const Card(
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
          const Card(
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
          const SizedBox(height: 16), // Add a SizedBox with height 16
          Card(
            child: ListTile(
              leading: const Icon(Icons.exit_to_app), // Add a leave/exit icon
              title: const Text('Logout'),
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
