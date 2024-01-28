import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TontineGroupCreation extends StatefulWidget {
  const TontineGroupCreation({Key? key}) : super(key: key);

  @override
  State<TontineGroupCreation> createState() => _TontineGroupCreationState();
}

class _TontineGroupCreationState extends State<TontineGroupCreation> {
  final _formKey = GlobalKey<FormState>();
  final _groupNameController = TextEditingController();
  final _groupMembersController = TextEditingController();
  final _rulesController = TextEditingController();
  final _selectedOptions = <String>[];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('lib/assets/images/tontineo_logo.png',
                width: 50, height: 50),
            const Icon(Icons.group),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
       
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Create a Tontine Group',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),             
              const SizedBox(height: 20),
              // Column with TextFormFields
              TextFormField(
                controller: _groupNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a group name';
                  }
                  return null; // Indicates successful validation
                },
                decoration: const InputDecoration(
                  labelText: 'Group Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _groupMembersController,
                decoration: const InputDecoration(
                  labelText: 'Add Group Members',
                  border: OutlineInputBorder(),
                ),                               
              ),
              const SizedBox(height: 20),
              
              FormField(
                builder: (FormFieldState<dynamic> state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Set Rules',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CheckboxListTile(
                        title: Text('Require Members to have Identification Documents(ID or Passport)'),
                        value: _selectedOptions.contains('Option 1'),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              _selectedOptions.add('Option 1');
                            } else {
                              _selectedOptions.remove('Option 1');
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Require Members to share contact information'),
                        value: _selectedOptions.contains('Option 2'),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              _selectedOptions.add('Option 2');
                            } else {
                              _selectedOptions.remove('Option 2');
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Require Members to share device location '),
                        value: _selectedOptions.contains('Option 3'),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              _selectedOptions.add('Option 3');
                            } else {
                              _selectedOptions.remove('Option 3');
                            }
                          });
                        },
                      ),
                      // Require Members to Agree to Terms & Conditions 
                    ],
                  );
                },
                validator: (value) {
                  if (_selectedOptions.isEmpty) {
                    return 'Please select at least one option';
                  }
                  return null; // Indicates successful validation
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _rulesController,
                decoration: const InputDecoration(
                  labelText: 'Set Additional Rules',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              // Create Tontine Group button
              ElevatedButton(
                onPressed: () async {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save(); // Save form data

        // Get form data
        final groupName = _groupNameController.text;
        final groupMembers = _groupMembersController.text;
        final rules = _rulesController.text;

        // Create a Map to store the data
        final tontineGroupData = {
          'groupName': groupName,
          'groupMembers': groupMembers,
          'rules': rules,
        };

        try {
          await FirebaseFirestore.instance
              .collection('tontines')
              .add(tontineGroupData);
          // Handle successful upload (e.g., show a success message)
        } catch (e) {
          // Handle unsuccessful upload (e.g., show a failure message)
        }
      } 
    },

                style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      minimumSize: const Size.fromHeight(70.0),
                    ),
                child: const Text(
                  'Create Tontine Group',
                  style: TextStyle(color: Colors.white),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
