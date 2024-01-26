import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tontineo_mobile_app/data/model/AdminModel.dart';
import 'package:tontineo_mobile_app/data/model/user.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_Event.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_bloc.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_state.dart';
import 'package:tontineo_mobile_app/ui/home/home/tontine_group_creation.dart';


class TontineHomePage extends StatelessWidget {
  const TontineHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 243, 243, 1),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage("lib/assets/images/avatar.png"), 
            ),
            Spacer(),
            SizedBox(width: 8.0),
            Text(
              "Hi",
              style: TextStyle(fontSize: 20.0),
            ),
            Spacer(),
            Icon(Icons.notifications, color: Colors.green,),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 315.458984375,
              height: 156.80709838867188,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.06873607635498),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "You have no Tontine Group",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TontineGroupCreation(),
                        ),
                      );

                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0da62f),
                      padding: EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      minimumSize: Size(100, 46),
                    ),
                    child: Text(
                      "Create Tontine",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    "lib/assets/images/group_image.png", 
                    height: 180.0,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "You have not created a group yet",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'DASHBOARD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.paypal),
            label: 'CONTRIBUTIONS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'SETTINGS',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.popAndPushNamed(context, '/home');
              break;
            case 1:
              Navigator.popAndPushNamed(context, '/contributions');
              break;
            case 2:
              Navigator.popAndPushNamed(context, '/settings');
              break;
          }
        },
      ),


    // Reference to the 'users' collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Get the document snapshot corresponding to the provided user ID
    DocumentSnapshot documentSnapshot = await users.doc(userId).get();
    print("userrr 2 ..... ${documentSnapshot}");
    // Check if the document exists
    if (documentSnapshot.exists) {
      // Extract data from the document snapshot
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      // Create an AdminModel object from the data
      AdminModel user = AdminModel(
        name: data['name'],
        email: data['email'],
        uid: data['uid'],
        phone: data['phone'],
        selectedUserType: data['selectedUserType'],
      );
      print("userrr ..... ${user}");
      return user;
    } else {
      print('Document does not exist');
    }
  } catch (e) {
    print('Error getting user by ID: $e');

  }
}