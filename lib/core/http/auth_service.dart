
import 'package:apex_dmit/core/http/response.dart';
import 'package:flutter/material.dart';

import 'http_session.dart';

class AuthService {
  final ApiClient _apiClient = ApiClient.instance;

  Future<DResponse> login(String email, String password) async {
    try {
      DResponse response = await _apiClient.post(
        'interview/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if(response.status==200) {
        final String token = response.data['access_token'];
        await _apiClient.saveToken(token);
        return response;
      }else {
        return response;
      }
    } catch (e) {
      return DResponse(
          data: null,
          message: 'Login failed: $e',
          status: -1000
      );
    }
  }

  Future<void> logout() async {
    await _apiClient.clearToken();
  }

  Future<bool> isLoggedIn() async {
    final String? token = await _apiClient.loadToken();
    if(token != null)_apiClient.setAuthToken(token);
    return token != null;
  }
}