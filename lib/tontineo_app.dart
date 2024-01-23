import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/login_page.dart';
import 'package:tontineo_mobile_app/splash_screen.dart';
import 'package:tontineo_mobile_app/tontine_group_creation.dart';
import 'package:tontineo_mobile_app/tontineo_home_page.dart';
import 'package:tontineo_mobile_app/tontineo_signup_page.dart';



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
      routes: <String, WidgetBuilder> {
        '/splash': (context) => const SplashScreen(),
        '/welcome': (context) => SignUpPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => TontineoHomePage(),


      },
    );
  }
}