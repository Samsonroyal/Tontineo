import 'package:flutter/material.dart';


class TontineGroupCreation extends StatelessWidget {
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

class TontineGroupCreator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('lib/assets/images/tontineo_logo.png', width: 50, height: 50), 
            Text('Hello Kossi, \n You have not create a Tontine yet!'),
            Icon(Icons.group),
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
              decoration: InputDecoration(
                labelText: 'Group Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Set Rules',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Create Tontine Group button
            ElevatedButton(
              onPressed: () {
                // Add your onPressed code here
              },
              style: ElevatedButton.styleFrom(
                      primary:
                          Colors.green, // Set the background color to green
                    ),
              child: Text('Create Tontine Group',
              style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
