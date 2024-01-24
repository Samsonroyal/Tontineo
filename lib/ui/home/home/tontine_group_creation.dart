import 'package:flutter/material.dart';


class TontineGroupCreation extends StatelessWidget {
  const TontineGroupCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tontine Group Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TontineGroupCreator(),
    );
  }
}

class TontineGroupCreator extends StatelessWidget {
  const TontineGroupCreator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('lib/assets/images/tontineo_logo.png', width: 50, height: 50), 
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
                // Add your onPressed code here
              },
              style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Set the background color to green
                    ),
              child: const Text('Create Tontine Group',
              style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
