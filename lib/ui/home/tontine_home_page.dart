import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tontineo_mobile_app/data/model/user.dart';
import 'package:tontineo_mobile_app/state/authentication_Event.dart';
import 'package:tontineo_mobile_app/state/authentication_bloc.dart';
import 'package:tontineo_mobile_app/state/authentication_state.dart';

class TontineHomePage extends StatefulWidget {
  static String id = 'home';
  final UserModel? user;

  const TontineHomePage({Key? key, this.user}) : super(key: key);

  @override
  State<TontineHomePage> createState() => _TontineHomePageState();
}

class _TontineHomePageState extends State<TontineHomePage> {
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
            Text(
              "Hi kossi ${widget.user?.email}",
              style: const TextStyle(fontSize: 20.0),
            ),
            const Spacer(),
            const Icon(
              Icons.notifications,
              color: Colors.green,
            ),
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
            // Column like a pop-up
            Container(
              width: 315.458984375,
              height: 156.80709838867188,
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
                      // Add your button action here
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
            const SizedBox(height: 150.0),

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
