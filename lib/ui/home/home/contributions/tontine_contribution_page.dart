import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/ui/home/home/contributions/group/record_contributions_page.dart';
import 'package:tontineo_mobile_app/ui/home/home/contributions/personal/make_contributions_page.dart';
import 'package:tontineo_mobile_app/ui/home/home/tontine_group_creation.dart';

class RecordContributions extends StatefulWidget {
  const RecordContributions({Key? key}) : super(key: key);

  @override
  State<RecordContributions> createState() =>
      _RecordContributions();
}

class _RecordContributions extends State<RecordContributions> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text('Tontine Contributions'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: true, // Condition to check if user has no tontine group
              child: Container(
                width: 315.458984375,
                height: 180.80709838867188,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11.06873607635498),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16.0),
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
                      height: 40.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the TontineGroupCreationPage screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TontineGroupCreation()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0da62f),
                        padding: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        minimumSize: const Size(164, 46),
                      ),
                      child: const Text(
                        "Create Tontine",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the RecordContribution screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecordContributionsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0da62f),
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                minimumSize: const Size.fromHeight(60.0),
              ),
              child: const Text(
                "Record Contributions",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the RecordContribution screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MakeContributionsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0da62f),
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                minimumSize: const Size.fromHeight(60.0),
              ),
              child: const Text(
                "Make Personal Contributions",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("lib/assets/images/avatar.png"), // Replace with actual image path
            ),
            const SizedBox(height: 10.0),
            Text(
              "Kossi", // Replace with the user's name
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            // Add other relevant information as needed
          ],
        ),
      ),
    );
  }
}



