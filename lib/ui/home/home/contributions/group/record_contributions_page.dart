                  import 'package:cloud_firestore/cloud_firestore.dart';
                  import 'package:flutter/material.dart';
                  import 'package:cherry_toast/cherry_toast.dart';

                  class RecordContributionsPage extends StatefulWidget {
                    @override
                    _RecordContributionsPageState createState() => _RecordContributionsPageState();
                  }

                  class _RecordContributionsPageState extends State<RecordContributionsPage> {
                    final _formKey = GlobalKey<FormState>();
                    String? _selectedDate;
                    String? _selectedPaymentMethod;
                    String? _amountController;
                    String? _groupMemberController;
                    String? _groupNameController ;
                    String? _receivedFromController;
                    String? _recipientSignatureController;
                    String? _dateController;

                    @override
                    Widget build(BuildContext context) {
                      return Scaffold(                        
                        appBar: AppBar(
                          title: const Text('Record Contributions'),
                        ),
                        body: SingleChildScrollView(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                // Date
                              
                                TextFormField(
                                  initialValue: _dateController,
                                  decoration: InputDecoration(
                                    labelText: 'Date',
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
                                        
                                        onChanged: (String? newValue) {
                                    setState(() {
                                      _dateController = newValue;
                                    });
                                  };
                                        setState(() {
                                          _selectedDate = selectedDate.toString();
                                        });
                                      },
                                      icon: const Icon(Icons.calendar_today,
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

                                // Record Contribution button
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // Upload data to Firestore
                                      FirebaseFirestore.instance.collection('collections').add({
                                        'date': _selectedDate,
                                        'amount': _amountController,
                                        'groupMember': _groupMemberController,
                                        'groupName': _groupNameController,                                        
                                        'receivedFrom': _receivedFromController,
                                        'paymentMethod': _selectedPaymentMethod,
                                        'recipientSignature': _recipientSignatureController,
                                      }).then((value) {
                                        // Display toast notification
                                        CherryToast.info(
                                          title: Text("Contribution Recorded Successfully!",
                                              style: TextStyle(color: Colors.black)),
                                          action: Text("Go to Dashboard",
                                              style: TextStyle(color: Colors.black)),
                                          actionHandler: () {
                                            print("Action button pressed");
                                          },
                                        ).show(context);
                                      }).catchError((error) {
                                        // Handle error
                                        print("Error: $error");
                                      });
                                    }
                                  },
                                  child: const Text('Record Contribution'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
