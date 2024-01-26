import 'package:flutter/material.dart';

class RecordContribution extends StatefulWidget {
  @override
  _RecordContributionState createState() => _RecordContributionState();
}

class _RecordContributionState extends State<RecordContribution> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedDate;
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record Contribution'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Amount received (GHS)
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount received (GHS)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Amount required';
                  }
                  return null;
                },
              ),
              // Date Received: with dropdown
              DropdownButtonFormField<String>(
                value: _selectedDate,
                hint: Text('Date Received'),
                items: <String>[
                  '2024-01-26',
                  '2024-01-27',
                  // Add more dates as needed
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDate = newValue;
                  });
                },
              ),
              // Group Member received from
              TextFormField(
                decoration: InputDecoration(labelText: 'Group Member received from'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Member name required';
                  }
                  return null;
                },
              ),
              // Payment method: dropdown list
              DropdownButtonFormField<String>(
                value: _selectedPaymentMethod,
                hint: Text('Payment method'),
                items: <String>['Cash', 'Momo']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedPaymentMethod = newValue;
                  });
                },
              ),
              // Recipient Signature
              TextFormField(
                decoration: InputDecoration(labelText: 'Recipient Signature'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Signature required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              // Elevated button with border radius, green background, white text
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  backgroundColor: Colors.green,
                  primary: Colors.white,
                ),
                onPressed: () {
                  // Validate the form
                  if (_formKey.currentState!.validate()) {
                    // Process the form data
                    // You can add your logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Contribution recorded successfully!'),
                      ),
                    );
                  }
                },
                child: Text('Record Contribution'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
