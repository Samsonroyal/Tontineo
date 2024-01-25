import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/ui/home/home/invite_members_page.dart';
import 'package:tontineo_mobile_app/ui/auth/authentication_page.dart';
import 'package:tontineo_mobile_app/ui/auth/login/log_in.dart';
import 'package:tontineo_mobile_app/ui/auth/register/sign_up.dart';
import 'package:tontineo_mobile_app/ui/home/home/contributions/tontine_contribution_page.dart';

import 'package:tontineo_mobile_app/ui/home/tontine_home_page.dart';
import 'package:tontineo_mobile_app/ui/home/settings/tontine_settings_page.dart';

class TontineoApp extends StatelessWidget {
  const TontineoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tontineo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/main',
      routes: <String, WidgetBuilder>{
        '/signup': (context) => const SignupScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const TontineHomePage(),
        '/settings': (context) => const SettingsPage(),
        '/invite_members': (context) => InviteMembersPage(),
        '/contributions': (context) => TontineContributions(),
        '/contributions': (context) => TontineContributions(),
      },
      home: const AuthenticationFlowScreen(),
    );
  }
}
