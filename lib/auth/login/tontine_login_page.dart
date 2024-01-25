import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.ac_unit_sharp,
              size: 40.0,
              color: Colors.grey,
            ),
            SizedBox(width: 8.0),
            Text(
              "Tontineo App",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "WELCOME BACK",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          const Text("Enter your details to continue"),

          const SizedBox(height: 60.0),
          const SizedBox(height: 20.0),
          TextFormField(
            style: const TextStyle(color: Colors.green),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              prefixIcon: Icon(Icons.phone, color: Colors.grey[100]),
              hintText: "Phone Number*",
              filled: true,
              fillColor: Colors.white,
            ),
          ),

          // Password field
          const SizedBox(height: 20.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              prefixIcon: Icon(Icons.lock, color: Colors.grey[100]),
              hintText: "Password*",
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  // Implement the toggle visibility functionality
                },
              ),
            ),
          ),

// Text and clickable text row with checkbox
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: false, // You can manage the state of the checkbox
                onChanged: (bool? value) {
                  // Implement the logic to handle checkbox state changes
                },
              ),
              const Text("Keep me logged in"),
            ],
          ),

// Login Button
          const SizedBox(height: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Implement registration functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  minimumSize: const Size.fromHeight(60.0),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                  textWidthBasis: TextWidthBasis.longestLine,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't an account"),
              const SizedBox(width: 4.0),
              GestureDetector(
                onTap: () {
                  // Implement action for clickable text
                },
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
