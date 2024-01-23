import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tontine contribution form'),
        ),
        body: MyForm(), // Use the custom form class
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Field 1
            TextFormField(
              decoration: InputDecoration(labelText: 'Name of contributor'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ' name required';
                }
                return null;
              },
            ),
            // Input Field 2
            TextFormField(
              decoration: InputDecoration(labelText: 'Amount contributed'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'amount required';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Date of contribution'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ' date';
                }
                return null;
              },
            ),
            // Input Field 2
            TextFormField(
              decoration: InputDecoration(labelText: 'Siginature'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'name';
                }
                return null;
              },
            ),
            // Add more input fields as needed

            // Elevated Button
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),
              onPressed: () {
                // Validate the form
                if (_formKey.currentState!.validate()) {
                  // Process the form data
                  // You can add your logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Form submitted successfully!'),
                    ),
                  );
                }
              },
              child: Text('Record contribution'),
            ),
          ],
        ),
      ),
    );
  }
}
