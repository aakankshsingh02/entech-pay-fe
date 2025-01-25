import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/app_constants.dart';
import '../utils/api_exception.dart';
import 'storage_service.dart';

class ApiService {
  final http.Client _client = http.Client();
  final StorageService _storage = StorageService();

  Future<Map<String, String>> _getHeaders() async {
    final token = await _storage.getToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<dynamic> post(String endpoint, {dynamic body}) async {
    try {
      final response = await _client.post(
        Uri.parse('${AppConstants.apiUrl}$endpoint'),
        headers: await _getHeaders(),
        body: json.encode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      throw ApiException(message: 'Network error: $e');
    }
  }

  dynamic _handleResponse(http.Response response) {
    final data = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw ApiException(
        message: data['error'] ?? 'Request failed',
        statusCode: response.statusCode,
      );
    }
  }
}
