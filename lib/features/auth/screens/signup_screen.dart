import 'package:entech_pay_fe/features/auth/controllers/auth_controller.dart';
import 'package:entech_pay_fe/features/auth/widgets/auth_button.dart';
import 'package:entech_pay_fe/features/auth/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final AuthController authController = AuthController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthTextField(
                label: "Name",
                hintText: "Name",
                controller: authController.nameController,
                onChanged: (value) {
                  authController.name = value;
                }),
            const SizedBox(height: 16),
            AuthTextField(
              label: "Email",
              hintText: 'Email',
              controller: authController.emailController,
              onChanged: (value) {
                authController.email = value;
              },
            ),
            const SizedBox(height: 16),
            AuthTextField(
              label: "Password",
              hintText: 'Password',
              obscureText: true,
              controller: authController.passwordController,
              onChanged: (value) {
                authController.password = value;
              },
            ),
            const SizedBox(height: 16),
            AuthButton(
              label: 'Sign Up',
              onPressed: () async {
                final success = await authController.signup();
                if (success) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text(authController.errorMessage ?? 'Signup failed'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
