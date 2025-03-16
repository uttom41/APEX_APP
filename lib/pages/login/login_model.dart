
import 'package:flutter/cupertino.dart';

import '../../core/base_entity.dart';
import '../../core/http/auth_service.dart';

class LoginModel extends BaseEntity<LoginModel> {

  bool isLoading = false;
  bool rememberMe = false;
  bool obscureText = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  final AuthService authService = AuthService();

}