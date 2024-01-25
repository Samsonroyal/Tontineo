import 'package:flutter/material.dart';

class RecordContributionsScreen extends StatefulWidget {
  const RecordContributionsScreen({Key? key}) : super(key: key);

  @override
  State<RecordContributionsScreen> createState() =>
      _RecordContributionsScreenState();
}

class _RecordContributionsScreenState extends State<RecordContributionsScreen> {
  // Add any state variables you need here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Hi Kossi",
              style: TextStyle(fontSize: 20.0),
            ),
            Spacer(),
            Icon(Icons.notifications, color: Colors.green),
          ],
        ),
      ),
      body: const Column(
        children: [
          ProfileCard(),
          ContributionSection(),
          RecordButton(),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}

class TontineContributions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tontine Contributions"), // Add a descriptive title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                        // Handle "Create Tontine" button action
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

            const SizedBox(height: 50.0),
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
                  const SizedBox(height: 10.0),
                  const Text(
                    "No tontine contributions yet",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80.0),
            // Add a button to record contributions
            ElevatedButton(
              onPressed: () {
                // Handle "Record Contributions" button action
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
                // Handle "Record Contributions" button action
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
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the profile card widget
    return Container();
  }
}

class ContributionSection extends StatelessWidget {
  const ContributionSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the contribution section widget
    return Container();
  }
}

class RecordButton extends StatelessWidget {
  const RecordButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the record button widget
    return Container();
  }
}

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    // Implement the bottom navigation bar widget
    return Container();
  }
}
