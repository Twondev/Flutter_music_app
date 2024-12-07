import 'package:client/core/theme/app_pallete.dart';
import 'package:client/features/auth/view/pages/login_page.dart';
import 'package:client/features/auth/view/widgets/custom_field.dart';
import 'package:client/features/auth/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:client/features/auth/view/widgets/auth_gradient_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final val = ref.watch(authViewmodelProvider);
    print(val);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
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
              CustomField(
                hintText: 'Name',
                controller: nameController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                hintText: 'Email',
                controller: emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomField(
                hintText: 'Password',
                controller: passwordController,
                isObscrureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              AuthGradientButton(
                  buttonText: 'Sign Up',
                  onTap: () async {
                    // for not entring an empty section
                    if (formKey.currentState!.validate()) {
                      await ref.read(authViewmodelProvider.notifier).signUpUser(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: RichText(
                    text: TextSpan(
                  text: 'Already have an account? ',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const [
                    TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                            color: Pallete.gradient2,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
