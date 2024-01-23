import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/payment_method_Screen.dart';
import 'package:tontineo_mobile_app/tontine_contribution_form.dart';


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
      home:  MyApp(),
    );
  }
}


