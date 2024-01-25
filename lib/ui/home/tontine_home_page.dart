import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tontineo_mobile_app/data/model/AdminModel.dart';
import 'package:tontineo_mobile_app/data/model/user.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_Event.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_bloc.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_state.dart';
import 'package:tontineo_mobile_app/ui/home/home/tontine_group_creation.dart';

class TontineHomePage extends StatefulWidget {
  static String id = 'home';
  final UserModel? user;

  const TontineHomePage({Key? key, this.user}) : super(key: key);

  @override
  State<TontineHomePage> createState() => _TontineHomePageState();
}

class _TontineHomePageState extends State<TontineHomePage> {
  // BAD practice: move to state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 243, 243, 1),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage("lib/assets/images/avatar.png"),
            ),
            const Spacer(),
            const SizedBox(width: 8.0),
            FutureBuilder<AdminModel?>(
              future: getUserById(widget.user!.id.toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Text(snapshot.data!.name);
                } else {
                  return Text('User not found');
                }
              },
            ),
            // FutureBuilder<DocumentSnapshot>(
            //   future: fetchUserData(),
            //   builder: (BuildContext context,
            //       AsyncSnapshot<DocumentSnapshot> snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return CircularProgressIndicator();
            //     }

            //     if (snapshot.hasError) {
            //       return Text(
            //         "Error: ${snapshot.error}",
            //         style: const TextStyle(fontSize: 10.0),
            //       );
            //     }

            //     if (snapshot.hasData && snapshot.data!.exists) {
            //       Map<String, dynamic> data =
            //           snapshot.data!.data() as Map<String, dynamic>;
            //       return Text(
            //         "Hi ${data["name"]}",
            //         style: const TextStyle(fontSize: 20.0),
            //       );
            //     } else {
            //       return Text(
            //         "Document does not exist",
            //         style: const TextStyle(fontSize: 10.0),
            //       );
            //     }
            //   },
            // ),
            const Spacer(),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationLoadingState) {
                  const CircularProgressIndicator();
                } else if (state is AuthenticationFailureState) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('error'),
                        );
                      });
                }
              },
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(SignOut());
                  },
                );
              },
            ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TontineGroupCreation(),
                        ),
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
    );
  }
}

Future<AdminModel?> getUserById(String userId) async {
  try {
    print("userrr ..... ${userId}");
    print("userrr 1 ..... ${userId}");

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
      );
      print("userrr ..... ${user}");
      return user;
    } else {
      print('Document does not exist');
    }
  } catch (e) {
    print('Error getting user by ID: $e');
  }
  return null; // Return null if an error occurs or if document doesn't exist
}
