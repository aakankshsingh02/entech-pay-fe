import 'package:entech_pay_fe/features/auth/screens/forgot_password_screen.dart';
import 'package:entech_pay_fe/features/auth/screens/login_screen.dart';
import 'package:entech_pay_fe/features/auth/screens/signup_screen.dart';
import 'package:entech_pay_fe/homepage.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      signup: (context) => SignupScreen(),
      forgotPassword: (context) => ForgotPasswordScreen(),
      home: (context) => HomeScreen(),
    };
  }
}