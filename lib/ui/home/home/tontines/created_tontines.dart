import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/ui/home/home/contributions/personal/group_name_display_screen.dart';
import 'package:tontineo_mobile_app/ui/home/home/contributions/personal/make_contributions_page.dart';
import 'package:tontineo_mobile_app/ui/home/home/contributions/tontine_contribution_page.dart';
import 'package:tontineo_mobile_app/ui/home/home/invite_members_page.dart';

final Stream<QuerySnapshot> tontineSnapshots =
    FirebaseFirestore.instance.collection('tontineCollections').snapshots();

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
       
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TabBar(
          controller: _tabController,
          physics: ScrollPhysics(),
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.contacts),
              text: 'Invite Members',
            ),
            Tab(
              icon: Icon(Icons.money_rounded),
              text: 'Make Contributions',
            ),
            Tab(
              icon: Icon(Icons.attach_money),
              text: 'View Contributions',
            ),
            Tab(
              icon: Icon(Icons.bookmark),
              text: 'View Tontines',
            ),
          ],
        ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    InviteMembersPage (),                    
                    MakeContributionsPage(),
                    RecordContributions(),
                    GroupNameDisplayScreen(),
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

