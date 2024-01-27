import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/ui/home/home/contributions/personal/group_name_display_screen.dart';

class TontineGroupCreation extends StatelessWidget {
  const TontineGroupCreation({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tontine Group Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TontineGroupCreator(),
    );
  }
}

class TontineGroupCreator extends StatefulWidget {
  const TontineGroupCreator({Key? key}) : super(key: key);

  @override
  _TontineGroupCreatorState createState() => _TontineGroupCreatorState();
}

class _TontineGroupCreatorState extends State<TontineGroupCreator> {
  String groupName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('lib/assets/images/tontineo_logo.png',
                width: 50, height: 50),
            const Text('Hello Kossi, \n You have not create a Tontine yet!'),
            const Icon(Icons.group),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Column with TextFormFields
            TextFormField(
              onChanged: (value) {
                // Update the groupName variable when the text changes
                setState(() {
                  groupName = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Group Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Set Rules',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Create Tontine Group button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroupNameDisplayScreen(groupName: groupName),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.green, // Set the background color to green
              ),
              child: const Text(
                'Create Tontine Group',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
