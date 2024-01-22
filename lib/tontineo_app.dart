import 'package:flutter/material.dart';

import 'package:tontineo_mobile_app/tontine_group_creation.dart';



class TontineoApp extends StatelessWidget {
  const TontineoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TontineGroupCreation(),
    );
  }
}