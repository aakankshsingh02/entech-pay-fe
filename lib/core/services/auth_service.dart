import 'package:entech_pay_fe/core/services/api_service.dart';

class AuthService {
  final ApiService _api = ApiService();

  Future<Map<String, dynamic>> login(String email, String password) async {
    return await _api.post('/login', body: {
      'email': email,
      'password': password,
    });
  }

  Future<Map<String, dynamic>> signup(
    String name,
    String email,
    String password,
  ) async {
    return await _api.post('/signup', body: {
      'name': name,
      'email': email,
      'password': password,
    });
  }

  Future<Map<String, dynamic>> forgotPassword(String email) async {
    return await _api.post('/forgot-password', body: {
      'email': email,
    });
  }
}
