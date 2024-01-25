import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tontineo_mobile_app/state/authentication_Event.dart';
import 'package:tontineo_mobile_app/state/authentication_bloc.dart';
import 'package:tontineo_mobile_app/state/authentication_state.dart';
import 'package:tontineo_mobile_app/ui/auth/login/log_in.dart';
import 'package:tontineo_mobile_app/ui/auth/login/tontine_login_page.dart';
import 'package:tontineo_mobile_app/ui/home/tontine_home_page.dart';

class SignupScreen extends StatefulWidget {
  static String id = 'signup';

  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

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
          'Create Account',
          style: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text('Username'),
            const SizedBox(height: 10),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your username',
              ),
            ),
            const SizedBox(height: 10),
            const Text('Phone'),
            const SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your phone',
              ),
            ),
            const SizedBox(height: 10),
            const Text('Email address'),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 10),
            const Text('Password'),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your password',
              ),
              obscureText: false,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Forgot password?',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(height: 20),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationSuccessState) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TontineHomePage()),
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
                        SignUpUser(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          phoneController.text.trim(),
                          nameController.text.trim(),
                        ),
                      );
                    },
                    child: Text(
                      state is AuthenticationLoadingState
                          ? '.......'
                          : 'Signup',
                      style: const TextStyle(
                        fontSize: 20,
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
                const Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.deepPurple,
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
