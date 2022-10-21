import 'package:banking_app/constants/route_names.dart';
import 'package:banking_app/constants/shared_pref_keys.dart';
import 'package:banking_app/data/local_data/local_data.dart';
import 'package:banking_app/data/models/auth_state.dart';
import 'package:banking_app/providers/auth_provider.dart';
import 'package:banking_app/utils/my_fonts.dart';
import 'package:banking_app/utils/my_icons.dart';
import 'package:banking_app/utils/utility_functions.dart';
import 'package:banking_app/views/auth/widgets/custom_text_button.dart';
import 'package:banking_app/views/auth/widgets/custom_text_field.dart';
import 'package:banking_app/views/auth/widgets/password_text_field.dart';
import 'package:banking_app/views/auth/widgets/simple_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../widgets/auth_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  void dispose() {
    passwordFocusNode.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        MyIcons.loginAnimation,
                        reverse: true,
                      ),
                      Text("Login",
                          style: MyFonts.w600.copyWith(fontSize: 22.sp)),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        onSubmitted: (v) {
                          UtilityFunctions.fieldFocusChange(
                            context,
                            emailFocusNode,
                            passwordFocusNode,
                          );
                        },
                        focusNode: emailFocusNode,
                        textEditingController: emailTextEditingController,
                        hintText: "Email",
                        prefixIcon: MyIcons.emailIcon,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 7.h),
                      PasswordTextField(
                        hintText: "Password",
                        focusNode: passwordFocusNode,
                        onSubmitted: (v) {
                          passwordFocusNode.unfocus();
                        },
                        show: context
                            .watch<AuthProvider>()
                            .loginPasswordVisibility,
                        textEditingController: passwordTextEditingController,
                        passwordShowOnTap: () {
                          context
                              .read<AuthProvider>()
                              .changeLoginPasswordVisibility();
                        },
                      ),
                      SizedBox(height: 56.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 56.w),
                        child: CustomTextButton(
                          onPressed: () {
                            String emailTextField =
                                emailTextEditingController.text;
                            String passwordTextField =
                                passwordTextEditingController.text;
                            String? emailStorage = StorageRepository.getString(
                                keyOfValue: SharedPrefKeys.email);
                            String? passwordStorage =
                                StorageRepository.getString(
                                    keyOfValue: SharedPrefKeys.passwordEmail);
                            if (context.read<AuthProvider>().authState !=
                                AuthState.registered) {
                              UtilityFunctions.getMyToast(
                                message: "This email has\nnot registrated",
                                context: context,
                              );
                            } else if (emailStorage != emailTextField) {
                              UtilityFunctions.getMyToast(
                                message: "Password or email is wrong",
                                context: context,
                              );
                            } else if (passwordTextField != passwordStorage) {
                              UtilityFunctions.getMyToast(
                                message: "Password or email is wrong",
                                context: context,
                              );
                            } else {
                              context.read<AuthProvider>().loginUser(
                                    email: emailTextField,
                                    password: passwordTextField,
                                  );
                              UtilityFunctions.getMyToast(
                                message: "Set pin",
                                context: context,
                              );
                              Navigator.of(context)
                                  .pushNamed(RouteNames.security);
                            }
                          },
                          title: "LOGIN",
                        ),
                      ),
                      SizedBox(height: 13.h),
                      Text(
                        "OR",
                        style: MyFonts.w400.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "Log in with",
                        style: MyFonts.w400.copyWith(fontSize: 12.sp),
                      ),
                      SizedBox(height: 20.h),
                      const AuthButtons(),
                      SizedBox(height: 10.h),
                      SimpleTextButton(
                        title: "Don't have an account? Register now",
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            RouteNames.regist,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  
}


