import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
 const PaymentMethodScreen({super.key});

 @override
 Widget build(BuildContext context) {
    final Map<String, IconData> paymentMethods = {
      'Cash': Icons.attach_money,
      'Bank': Icons.account_balance,
      'USSD': Icons.phone,
      'Mobile Money': Icons.phone_android,
    };

    return Scaffold(
      backgroundColor: Colors.green.withOpacity(0.5), // Dim the background
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Pay GHC 3000',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text('Select the method of Payment'),
              const SizedBox(height: 16),
              Expanded(
                child: Theme(
                 data: Theme.of(context).copyWith(
                    canvasColor: Colors.white,
                 ),
                 child: DropdownButton<String>(
                    value: null,
                    hint: const Text("Select"),
                    items: paymentMethods.keys.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Row(
                          children: [
                            Icon(paymentMethods[option]!),
                            const SizedBox(width: 8),
                            Text(option),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Handle dropdown selection
                    },
                 ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                 // Handle continue button click
                },
                style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.green,
                ),
                child: const Text(
                 'Continue',
                 style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
 }
}
