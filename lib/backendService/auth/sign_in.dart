import 'dart:convert';

import 'package:coding_game/model/auth/sign_in.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SignInService {
  Future<SignInModel> signInUser({
    required String email,
    required String password,
  }) async {
    final baseUrl = dotenv.env['BACKEND_URL'];
    final url = Uri.parse('$baseUrl/login');
    final Map<String, String> headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({'email': email, 'password': password});

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return SignInModel.fromJson(data);
      } else if (response.statusCode == 401) {
        final error = jsonDecode(response.body);
        throw error['detail'];
      } else {
        throw '${response.statusCode}';
      }
    } catch (e) {
      rethrow;
    }
  }
}
