import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/data/model/user.dart';
import 'package:tontineo_mobile_app/ui/auth/register/sign_up.dart';
import 'package:tontineo_mobile_app/ui/home/tontine_home_page.dart';

class AuthenticationFlowScreen extends StatelessWidget {
  const AuthenticationFlowScreen({super.key});
  static String id = 'main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SignupScreen();
          } else {
            final user = snapshot.data;
            return TontineHomePage(
              user: UserModel(
                id: user?.displayName,
                email: user?.email,
                displayName: user?.displayName,
              ),
            );
          }
        },
      ),
    );
  }
}
