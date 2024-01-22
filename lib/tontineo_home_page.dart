import 'package:flutter/material.dart';

class TontineoHomePage extends StatefulWidget {
  const TontineoHomePage({Key? key}) : super(key: key);

  @override
  _TontineoHomePageState createState() => _TontineoHomePageState();
}

class _TontineoHomePageState extends State<TontineoHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('hello kossi'),
        ),
        body: Center(
          child: Image.asset('assets/profile.png'),
        ),
     ),
);
bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'DASHBOARD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.paypal),
            label: 'CONTRIBUTIONs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'SETTINGS',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
}
}