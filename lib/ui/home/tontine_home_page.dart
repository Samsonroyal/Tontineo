import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/data/model/AdminModel.dart';
import 'package:tontineo_mobile_app/ui/home/home/contributions/tontine_contribution_page.dart';
import 'package:tontineo_mobile_app/ui/home/home/tontine_group_creation.dart';
import 'package:tontineo_mobile_app/ui/home/home/tontines/created_tontines.dart';
import 'package:tontineo_mobile_app/ui/home/settings/tontine_settings_page.dart';

class TontineHomePage extends StatefulWidget {
  const TontineHomePage({super.key});

  @override
  _TontineHomePageState createState() => _TontineHomePageState();
}

class _TontineHomePageState extends State<TontineHomePage> {
  AdminModel? user;

  @override
  void initState() {
    user = null;
    getUser();
    super.initState();
  }

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
        backgroundColor: Color.fromARGB(255, 144, 144, 144),
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
            Text(
              user != null ? "Hi, ${user?.email}" : "Hi, User",
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
      selectedItemColor: Color.fromARGB(255, 35, 199, 57),
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

  getUser() {
    // Reference to the 'users' collection
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event == null) {
        return;
      }
      print("hello" + event.toString());
      setState(() {
        user = AdminModel(
          name: event.email!,
          email: event.email!,
          uid: event.uid,
          phone: event.phoneNumber ?? '',
        );
      });
    });
  }
}
