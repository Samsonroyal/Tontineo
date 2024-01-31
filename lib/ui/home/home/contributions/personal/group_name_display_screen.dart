import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupInformation extends StatefulWidget {
  // Declare a variable to hold the group name
  final String groupName;

  // Constructor to receive the group name when navigating to this screen
  const GroupInformation({Key? key, this.groupName = ''})
      : super(key: key);

  @override
  _GroupInformationState createState() => _GroupInformationState();
}

class _GroupInformationState extends State<GroupInformation> {
  final Stream<QuerySnapshot> _groupStream =
      FirebaseFirestore.instance.collection('tontines').snapshots();
      filterData() {
    return FirebaseFirestore.instance
        .collection('tontines')
        .where('groupOwner', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
        }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _groupStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Created Groups'),
           
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      print("Hello there" + document.data().toString());
                      var data =
                          document.data()! as Map;
                      return ListTile(
                        title: Text(data['groupName'] ?? 'Default Group Name'),
                        subtitle: Text((data['groupMembers'] ?? '0')),
                      );
                    }).toList(),
                  ),
                ),              
              ],
            ),
          ),
        );
      },
    );
  }
}
