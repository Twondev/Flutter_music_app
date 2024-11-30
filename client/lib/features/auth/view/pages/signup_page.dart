import 'package:client/features/auth/view/widgets/client/lib/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:client/features/auth/view/widgets/custom_feild.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up.',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFeild(
              hintText: 'Name',
            ),
            const SizedBox(
              height: 15,
            ),
            CustomFeild(hintText: 'Email'),
            const SizedBox(
              height: 15,
            ),
            CustomFeild(
              hintText: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
            AuthGradientButton(),
          ],
        ),
      ),
    );
  }
}