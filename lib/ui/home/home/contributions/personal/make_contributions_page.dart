
import 'package:flutter/material.dart';

            class MakeContributionsPage extends StatefulWidget {
              @override
              _MakeContributionsPageState createState() => _MakeContributionsPageState();
            }

            class _MakeContributionsPageState extends State<MakeContributionsPage> {
              final _formKey = GlobalKey<FormState>();
              bool isMomoSelected = false;
              late String selectedMobileNetwork;
              TextEditingController _contributionAmountController = TextEditingController();
              TextEditingController _mobileNumberController = TextEditingController();
              TextEditingController _emailController = TextEditingController();

              @override
              Widget build(BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Make Contributions'),
                  ),
                  body: Form(
                    key: _formKey,
                    child: ListView(
                      padding: EdgeInsets.all(16.0),
                      children: [
                        TextFormField(
                          controller: _contributionAmountController,
                          decoration: const InputDecoration(
                            labelText: 'Contribution Amount (GHS)',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the contribution amount';
                            }
                            return null;
                          },
                        ),
                        ListTile(
                          title: Text('Payment Method:'),
                          subtitle: Row(
                            children: [
                              Radio(
                                value: false,
                                groupValue: isMomoSelected,
                                onChanged: (value) {
                                  setState(() {
                                    isMomoSelected = value!;
                                  });
                                },
                              ),
                              Text('Cash'),
                              Radio(
                                value: true,
                                groupValue: isMomoSelected,
                                onChanged: (value) {
                                  setState(() {
                                    isMomoSelected = value!;
                                  });
                                },
                              ),
                              Text('Momo'),
                            ],
                          ),
                        ),
                        if (isMomoSelected)
                          Column(
                            children: [
                              DropdownButtonFormField<String>(
                                value: selectedMobileNetwork,
                                onChanged: (value) {
                                  setState(() {
                                    selectedMobileNetwork = value!;
                                  });
                                },
                                items: [
                                  DropdownMenuItem(
                                    value: 'MTN',
                                    child: Text('MTN'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Airtel Tigo',
                                    child: Text('Airtel Tigo'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Orange',
                                    child: Text('Orange'),
                                  ),
                                ],
                                decoration: InputDecoration(
                                  labelText: 'Mobile Network',
                                ),
                              ),
                              TextFormField(
                                controller: _mobileNumberController,
                                decoration: InputDecoration(
                                  labelText: 'Mobile Number',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the contribution amount';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Proceed to input Momo PIN'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'You are about to make a payment of GH₵${_contributionAmountController.text} using the selected payment method.',
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context); // Cancel button pressed
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6.0),
                                          ),
                                        ),
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          // Proceed button pressed, redirect to input mobile money pin
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.green,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6.0),
                                          ),
                                        ),
                                        child: Text(
                                          'Proceed',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          child: Text(
                            'Send Contribution',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
            
