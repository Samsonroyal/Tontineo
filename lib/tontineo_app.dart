import 'package:flutter/material.dart';
import 'package:tontineo_mobile_app/payment_method_Screen.dart';

class TontineoApp extends StatelessWidget {
  const TontineoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PaymentMethodScreen(),
    );
  }
}


