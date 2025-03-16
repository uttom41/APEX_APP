
import 'package:apex_dmit/core/utils.dart';
import 'package:flutter/material.dart';

import '../../core/base_viewmodel.dart';
import '../../core/component/tost.dart';
import '../../core/http/response.dart';
import 'login_model.dart';

class LogInViewModel extends BaseViewModel<LoginModel> {

  LogInViewModel() : super();

  late LoginModel _entity;

  @override
  void buildProps() {

  }

  @override
  void initState() {
    _entity = getEntity();
    authCheck();
  }

  void authCheck() async {
    final bool isLoggedIn = await _entity.authService.isLoggedIn();
    if(isLoggedIn) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(ref.context).pushReplacementNamed("/purchase_list");
      });

    }
  }

  void setIsLoading(bool status) {
    _entity.isLoading = status;
    updateEntity(_entity);
  }

  bool get isLoading => getEntity().isLoading;

  void setObscureText(bool status) {
    _entity.obscureText = status;
    updateEntity(_entity);
  }

  bool get isObscureText => getEntity().obscureText;

  void setRememberMe(bool status) {
    _entity.rememberMe = status;
    updateEntity(_entity);
  }

  bool get rememberMe => getEntity().rememberMe;

  TextEditingController get email => getEntity().emailController;

  void setEmail(String? email) {
    _entity.emailController.text = email??"";
    updateEntity(_entity);
  }

  TextEditingController get password => getEntity().passwordController;

  void setPassword(String? password) {
    _entity.passwordController.text = password??"";
    updateEntity(_entity);
  }


  void logInBtn() async{
    setIsLoading(true);
    if(_entity.emailController.text.isNotEmpty && _entity.passwordController.text.isNotEmpty) {
      DResponse response = await _entity.authService.login(_entity.emailController.text, _entity.passwordController.text);
      if (response.status==200) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showToast(
              context:ref.context,
              duration: 2,
              message: response.data['status_message'],
              backgroundColor: AppColors.informationColor
          );
          setIsLoading(false);
          Navigator.of(ref.context).pushReplacementNamed("/purchase_list");

        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showToast(
              context:ref.context,
              duration: 4,
              message: response.message,
              backgroundColor: AppColors.actionColor
          );
        });
      }
    } else {
      showToast(
          context:ref.context,
          duration: 4,
          message: "Password and email are mandatory fields.",
        backgroundColor: AppColors.actionColor
      );
    }
    setIsLoading(false);
  }

}