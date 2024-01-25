import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_Event.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_bloc.dart';
import 'package:tontineo_mobile_app/state/auth/authentication_state.dart';
import 'package:tontineo_mobile_app/ui/auth/register/sign_up.dart';
import 'package:tontineo_mobile_app/ui/home/tontine_home_page.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';

  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login to your Account',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
            "Welcome Back",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
            const SizedBox(height: 20.0),
          const Text("Enter your details to continue"),
            const SizedBox(height: 20),
            const Text('Email address'),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                prefixIcon: Icon(Icons.email, color: Color.fromARGB(131, 6, 170, 0)),
                hintText: 'Enter your email address',
              ),
            ),
            const SizedBox(height: 10),
            const Text('Password'),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                prefixIcon: Icon(Icons.lock, color: Color.fromARGB(131, 6, 170, 0)),
                hintText: 'Password*',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
              
              },
              child: const Text(
                'Forgot password?',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 20),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationSuccessState) {
                  // Navigate to home page after successful login
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TontineHomePage(),
                    ),
                  );
                } else if (state is AuthenticationFailureState) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('error'),
                        );
                      });
                }
              },
              builder: (context, state) {
                return SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context).add(
                        SignInUser(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      minimumSize: const Size.fromHeight(70.0),
                    ),
                    child: Text(
                      state is AuthenticationLoadingState ? '.......' : 'Login',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text(
                    'Signup',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
