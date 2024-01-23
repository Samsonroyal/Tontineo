import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait 3 seconds, then navigate to the home screen.
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/welcome');
      print('Navigating to Welcome Screen...');

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              color: Colors.green, // Set the color to green
              child: Image.asset(
                'lib/assets/images/tontineo.png', // Replace with the path to your logo image
                width: 60.0,
                height: 60.0,
              ),
            ),
          ),
          const Text(
            'Tontineo',
            style: TextStyle(
              fontSize: 24.0,
              decoration: TextDecoration.none,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
