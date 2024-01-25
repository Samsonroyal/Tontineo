import 'package:flutter/material.dart';

class ChangePinScreen extends StatelessWidget {
  const ChangePinScreen({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add navigation logic to go back
            Navigator.of(context).pop();
          },
        ),
        title: Text("Change PIN",
        style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Input New PIN",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter New PIN",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Confirm New PIN",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Confirm New PIN",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            Spacer(), // Add space between text fields and button
            ElevatedButton(
              onPressed: () {
                // Add logic to handle PIN change
                _handleChangePin();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                minimumSize: Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(width: 1, color: Colors.green),
                ),
                foregroundColor: Colors.green,
              ),
              child: Text(
                "Change PIN",
                style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleChangePin() {
    // Add logic to handle PIN change when the button is pressed
    // This could include PIN validation, API calls, etc.
    print("PIN changed!");
  }
}

