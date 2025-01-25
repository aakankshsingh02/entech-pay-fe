import 'package:flutter/material.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/storage_service.dart';

class AuthController extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final ApiService _api = ApiService();
  final StorageService _storage = StorageService();

  bool isLoading = false;
  String? errorMessage;

  String _email = '';
  String _password = '';
  String _name = '';

  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get password => _password;
  set password(String value) {
    _password = value;
    notifyListeners();
  }

  String get name => _name;
  set name(String value) {
    _name = value;
    notifyListeners();
  }

  Future<bool> login() async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await _api.post('/auth/login', body: {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      });

      await _storage.saveToken(response['token']);
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signup() async {
    print("signup");
    try {
      isLoading = true;
      notifyListeners();

      final response = await _api.post('/auth/signup', body: {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text,
      });

      await _storage.saveToken(response['token']);
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> forgotPassword(String email) async {
    try {
      isLoading = true;
      notifyListeners();

      await _api.post('/auth/forgot-password', body: {
        'email': email.trim(),
      });
      return true;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
