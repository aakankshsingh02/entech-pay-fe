import 'package:entech_pay_fe/features/auth/controllers/auth_controller.dart';
import 'package:entech_pay_fe/features/auth/widgets/auth_button.dart';
import 'package:entech_pay_fe/features/auth/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  final AuthController authController = AuthController();

 LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthTextField(
              label: "Email",
              hintText: 'Email',
              controller: authController.emailController,
            ),
            const SizedBox(height: 16),
            AuthTextField(
              label: "Password",
              hintText: 'Password',
              controller: authController.passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            AuthButton(
              
              label: 'Login',
              onPressed: () async {
                final success = await authController.login();
                if (success) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text(authController.errorMessage ?? 'Login failed'),
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