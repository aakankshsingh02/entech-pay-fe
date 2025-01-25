import 'package:entech_pay_fe/features/auth/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'config/routes.dart';
import 'features/auth/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Entech Pay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Set the home property
      routes: AppRoutes.getRoutes(),
    );
  }
}
