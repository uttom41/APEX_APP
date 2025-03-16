import 'package:apex_dmit/core/px_to_dp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/component/native_button.dart';
import '../../core/component/native_text_field.dart';
import '../../core/component/nativr_check_box.dart';
import '../../core/index.dart';
import '../../core/utils.dart';
import 'index.dart';

class LogInScreen extends BaseScreen<LoginModel, LogInViewModel> {
  const LogInScreen({super.key});

  @override
  Widget buildBody(BuildContext context, LogInViewModel viewModel) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                image: const DecorationImage(
                  image: AssetImage('assets/images/Star.png'),
                  fit: BoxFit.cover,
                ),

              )
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 68.dp),
                    padding: EdgeInsets.only(left: 25.dp,right: 25.dp),
                    alignment: Alignment.center,
                    height: 157.dp,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/Vector.png", // Logo
                          height: 28.dp,
                          width: 28.dp,
                        ),
                        Text(
                          'Sign in to your Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Enter your email and password to log in',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 327.dp,
                    height: 304.dp,
                    padding: EdgeInsets.all(24.dp),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.dp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.dp,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        nativeTextField(
                            hintText: 'Email',
                           onChanged: (value){

                           },
                          controller: viewModel.email
                        ),
                        SizedBox(height: 15.dp),
                        nativeTextField(
                          obscureText: viewModel.isObscureText,
                            hintText: 'Password',
                            onChanged: (value){

                            },
                            suffixIcon: InkWell(
                              onTap: (){
                                viewModel.setObscureText(!viewModel.isObscureText);
                              },
                                child: Icon(Icons.visibility_off,color: Color(0xFFACB5BB))
                            ),
                           controller: viewModel.password
                           // prefixIcon: Icon(Icons.lock,color: Color(0xFFACB5BB))
                        ),

                        SizedBox(height: 15.dp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                nativeCheckBox(
                                  isChecked:viewModel.rememberMe,
                                  onChange: () {
                                    viewModel.setRememberMe(!viewModel.rememberMe);
                                  }
                                ),
                                SizedBox(width: 4.dp,),
                                Text('Remember me',style: TextStyle(color: AppColors.primaryTextColorLight,fontSize: 12.sp,fontWeight: FontWeight.w500),),
                              ],
                            ),
                            Text(
                              'Forgot Password ?',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.dp),
                        viewModel.isLoading?SizedBox(height:40.dp,width:40.dp,child: CircularProgressIndicator()):nativeButton(
                            text: "Log In",
                            width: 279.dp,
                            height: 48.dp,
                            bgColor: AppColors.informationColor,
                            style:  TextStyle(color: AppColors.white,fontSize: 14.sp,fontWeight: FontWeight.w500),
                            onPressed: (){
                              viewModel.logInBtn();
                            }),
                        SizedBox(height: 24.dp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? ",
                              style: TextStyle(color: AppColors.primaryTextColorLight, fontWeight: FontWeight.w500,fontSize: 12.sp),

                            ),
                            Text(
                              'Sign Up',
                              style: TextStyle(color: AppColors.informationColor, fontWeight: FontWeight.w600,fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}