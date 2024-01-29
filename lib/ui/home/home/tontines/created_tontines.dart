import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
        bottom: TabBar(
          controller: _tabController,
          physics: ScrollPhysics(),
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.bookmark),
              text: 'Tontines',
            ),
            Tab(
              icon: Icon(Icons.group),
              text: 'Members',
            ),
            Tab(
              icon: Icon(Icons.money_rounded),
              text: 'Contributions',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Center(
                      child: Text("Tontines"),
                    ),
                    Center(
                      child: Text("Members"),
                    ),
                    Center(
                      child: Text("Contributions"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      minimumSize: const Size.fromHeight(70.0),
                    ),
                    child: Text(
                      'Invite members',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // TODO: Implement invite members functionality
                    },
                  ),
                  OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      minimumSize: const Size.fromHeight(70.0),
                    ),
                    child: Text('Notify members',
                        style: TextStyle(color: Colors.green)),
                    onPressed: () {
                      // TODO: Implement notify members functionality
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),      
    );
  }
}

