import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/ui/home/home/invite_members_page.dart';

class GroupNameDisplayScreen extends StatelessWidget {
  // Declare a variable to hold the group name
  final String groupName;

  // Constructor to receive the group name when navigating to this screen
  const GroupNameDisplayScreen({Key? key, this.groupName = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('You have successfully created a Tontine Group'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Group Name: $groupName',
              style: const TextStyle(fontSize: 20),
            ),
            // Create Tontine Group button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InviteMembersPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Set the background color to green
              ),
              child: const Text(
                'Click here to add members',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
