import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/ui/home/home/tontine_contribution_page.dart';
import 'package:tontineo_mobile_app/auth/login/tontine_login_page.dart';
import 'package:tontineo_mobile_app/ui/splash/splash_screen.dart';
import 'package:tontineo_mobile_app/ui/home/tontine_home_page.dart';
import 'package:tontineo_mobile_app/ui/home/settings/tontine_settings_page.dart';
import 'package:tontineo_mobile_app/auth/register/tontineo_signup_page.dart';

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
      initialRoute: '/splash',
      routes: <String, WidgetBuilder>{
        '/splash': (context) => const SplashScreen(),
        '/welcome': (context) => const SignUpPage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const TontineHomePage(),
        '/settings': (context) => const SettingsPage(),
        '/contributions': (context) => const TontineContributions(),
      },
      home: const TontineHomePage(),
    );
  }
}
