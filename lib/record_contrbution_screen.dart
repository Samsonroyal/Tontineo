import 'package:flutter/material.dart';



class ContributionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contribution Recording Screen'),
        ),
        body: ContributionForm(),
      ),
    );
  }
}

class ContributionForm extends StatefulWidget {
  @override
  _ContributionFormState createState() => _ContributionFormState();
}

class _ContributionFormState extends State<ContributionForm> {
  final _formKey = GlobalKey<FormState>();

  // Sample dropdown items
  final List<String> categoryOptions = ['Category 1', 'Category 2', 'Category 3'];
  final List<String> frequencyOptions = ['Daily', 'Weekly', 'Monthly'];

  String selectedCategory = 'Category 1'; // Initialize with a default value
  String selectedFrequency = 'Daily'; // Initialize with a default value

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Input Field 1
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),

            // Dropdown Field 1
            SizedBox(height: 16.0),
            DropdownButtonFormField(
              value: selectedCategory,
              onChanged: (newValue) {
                setState(() {
                  selectedCategory = newValue as String;
                });
              },
              items: categoryOptions.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Category',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a category';
                }
                return null;
              },
            ),

            // Text Input Field 2
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                return null;
              },
            ),

            // Dropdown Field 2
            SizedBox(height: 16.0),
            DropdownButtonFormField(
              value: selectedFrequency,
              onChanged: (newValue) {
                setState(() {
                  selectedFrequency = newValue as String;
                });
              },
              items: frequencyOptions.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Frequency',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a frequency';
                }
                return null;
              },
            ),

            // Text Input Field 3
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3, // Multiline input
            ),

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
                      content: Text('Record submitted successfully!'),
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContributionScreen(),
    );
  }
}
