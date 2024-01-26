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
              // Date Received: with date picker
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Date Received(dd/mm/yyyy)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () async {
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime.now(),
                            );
                            setState(() {
                              _selectedDate = selectedDate?.toString();
                            });
                          },
                          icon: Icon(Icons.calendar_today,
                              color: Color.fromARGB(131, 6, 170, 0)),
                        ),
                        hintText: 'Select a Date',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Date required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),

                    // Group Member received from
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Received From',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        hintText: 'Write Group Member Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Member name required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),

                    // Payment method: dropdown list
                    DropdownButtonFormField<String>(
                      value: _selectedPaymentMethod,
                      decoration: const InputDecoration(
                        labelText: 'Payment Method',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        prefixIcon: Icon(Icons.attach_money,
                            color: Color.fromARGB(131, 6, 170, 0)),
                        hintText: 'select method',
                      ),
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
                    const SizedBox(height: 20.0),

                    // Recipient Signature
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Recipient Signature',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        hintText: 'Write Your Full Name',
                      ),
                    ),
                    const SizedBox(height: 20.0),

                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    onPressed: () {
                      //TODO: Add logic to record contribution
                    
                    },
                    child: Text('Record Contribution'),
                  ),
                ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
