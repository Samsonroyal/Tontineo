import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/data/model/AdminModel.dart';
import 'package:tontineo_mobile_app/data/model/user.dart';
import 'package:tontineo_mobile_app/ui/home/home/contributions/tontine_contribution_page.dart';
import 'package:tontineo_mobile_app/ui/home/home/tontine_group_creation.dart';
import 'package:tontineo_mobile_app/ui/home/home/tontines/created_tontines.dart';
import 'package:tontineo_mobile_app/ui/home/settings/tontine_settings_page.dart';


class TontineHomePage extends StatefulWidget {
  final UserModel user;
  const TontineHomePage({super.key, required this.user});

  @override
  _TontineHomePageState createState() => _TontineHomePageState();
}

class _TontineHomePageState extends State<TontineHomePage> {
  int activeIndex = 0;
  List<Widget> pages = [
    const TontineGroupCreation(),
    const DashboardPage(),    
    RecordContributions(),
    const SettingsPage(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      
      bottomNavigationBar: _myBottomNav(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage("lib/assets/images/avatar.png"),
            ),
            Spacer(),
            const SizedBox(width: 8.0),
            const Text(
              "Hi",
              style: TextStyle(fontSize: 20.0),
            ),
            Spacer(),
            const Icon(
              Icons.notifications,
              color: Colors.green,
            ),
          ],
        ),
      ),
      body: pages[activeIndex],     
    );
  }

  Widget _myBottomNav() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.credit_card), label: "Dashboard"),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: "Contributions"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
      ],
      type: BottomNavigationBarType.fixed,
      elevation: 7,
      selectedItemColor: const Color.fromARGB(255, 33, 243, 61),
      unselectedItemColor: const Color.fromARGB(255, 123, 118, 118),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (index) {
        setState(() {
          activeIndex = index;
        });
      },
      currentIndex: activeIndex,
    );
  }

  Future<AdminModel?> getUser(String userId) async {
    // Reference to the 'users' collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Get the document snapshot corresponding to the provided user ID
    DocumentSnapshot documentSnapshot = await users.doc(userId).get();
    debugPrint("userrr 2 ..... $documentSnapshot");
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
      debugPrint("user ..... $user");
      return user;
    } else {
      debugPrint('Document does not exist');
      return null;
    }
  }
}
