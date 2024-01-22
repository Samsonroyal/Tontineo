import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('tontine contribution form'),
        ),
        body: ContainerWithColumns(),
      ),
    );
  }
}

class ContainerWithColumns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'contribution form ',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Column 1
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount received'),
                  // Add your widgets for column 1 here
                ],
              ),
              // Column 2 (Input)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date received'),
                  // Input field for column 2
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'select date',
                    ),
                  ),
                ],
              ),
              // Column 3
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contribution recieved from'),
                  // Add your widgets for column 3 here
                ],
              ),
              // Column 4 (Input)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('payment method'),
                  // Input field for column 4
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'mobile money',
                    ),
                  ),
                ],
              ),
              // Column 5
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('recipient signature'),
                  // Add your widgets for column 5 here
                ],
              ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('record contribution'),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button click
                    },
                    child: Text('record Contribution'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}