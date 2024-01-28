import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Tontines'),
              Tab(text: 'Members'),
              Tab(text: 'Contributions'),
            ],
          ),
          Card(
            child: Column(
              children: [
                Text('Tontines Data'),
                Text('Members:'),
                Text('Name: Were Samson'),
                Text('Phone Number: 0786871705'),
                Text('Name: Lion Heart'),
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
                child: Text('Invite members',style: TextStyle(color: Colors.white),
                )
                ,
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
                
                child: Text('Notify members', style: TextStyle(color: Colors.green)),
                onPressed: () {
                  // TODO: Implement notify members functionality
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
