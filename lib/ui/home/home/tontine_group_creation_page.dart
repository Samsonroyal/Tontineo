import 'package:flutter/material.dart';

class TontineGroupCreationPage extends StatelessWidget {
  const TontineGroupCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white, // Set the background color to white
        elevation: 4, // Add an elevation of 4
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/tontine_logo.png", // Replace with the actual image asset path
              height: 40.0,
              width: 40.0,
            ),
            const Spacer(),
            const SizedBox(width: 8.0),
            const Text(
              "Hi Kossi",
              style: TextStyle(fontSize: 20.0),
            ),
            const Spacer(),
            const Icon(Icons.notifications, color: Colors.green,),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "You have no Tontine Group",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Create Tontine'),
                            content: Column(
                              children: [
                                // Add your fields here
                                // For example, TextFields for input
                                TextField(
                                  decoration: const InputDecoration(
                                    labelText: 'Field 1',
                                  ),
                                ),
                                TextField(
                                  decoration: const InputDecoration(
                                    labelText: 'Field 2',
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  // Perform the necessary actions when the dialog button is clicked
                                  // For example, navigate to the tontine_group_creation.dart page
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TontineGroupCreationPage(),
                                    ),
                                  );
                                },
                                child: const Text('Create'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Set the background color to green
                    ),
                    child: const Text(
                      'Create Tontine',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 150.0),

            // Column with image and text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/tontine_logo.png", // Replace with the actual image asset path
                    height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'DASHBOARD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.paypal),
            label: 'CONTRIBUTIONs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'SETTINGS',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    );
  }
}
