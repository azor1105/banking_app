import 'package:banking_app/providers/auth_provider.dart';
import 'package:banking_app/utils/my_fonts.dart';
import 'package:banking_app/utils/my_icons.dart';
import 'package:banking_app/utils/utility_functions.dart';
import 'package:banking_app/views/auth/widgets/custom_text_button.dart';
import 'package:banking_app/views/auth/widgets/custom_text_field.dart';
import 'package:banking_app/views/auth/widgets/password_text_field.dart';
import 'package:banking_app/views/auth/widgets/simple_text_button.dart';
import 'package:banking_app/views/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../constants/route_names.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({super.key});

  @override
  State<RegistScreen> createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _firstNameController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameController.dispose();
    _lastNameFocusNode.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.read<AuthProvider>().isLoading
          ? const LoadingScreen()
          : SizedBox(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        MyIcons.registAnimation,
                        reverse: true,
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      Text(
                        "Sign Up",
                        style: MyFonts.w600.copyWith(fontSize: 22.sp),
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        onSubmitted: (v) {
                          UtilityFunctions.fieldFocusChange(
                            context,
                            _firstNameFocusNode,
                            _lastNameFocusNode,
                          );
                        },
                        focusNode: _firstNameFocusNode,
                        textEditingController: _firstNameController,
                        hintText: "First Name",
                        prefixIcon: MyIcons.profileIcon,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: 7.h),
                      CustomTextField(
                        onSubmitted: (v) {
                          UtilityFunctions.fieldFocusChange(
                            context,
                            _lastNameFocusNode,
                            _emailFocusNode,
                          );
                        },
                        focusNode: _lastNameFocusNode,
                        textEditingController: _lastNameController,
                        hintText: "Last Name",
                        prefixIcon: MyIcons.profileIcon,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: 7.h),
                      CustomTextField(
                        onSubmitted: (v) {
                          UtilityFunctions.fieldFocusChange(
                            context,
                            _emailFocusNode,
                            _passwordFocusNode,
                          );
                        },
                        focusNode: _emailFocusNode,
                        textEditingController: _emailController,
                        hintText: "Email",
                        prefixIcon: MyIcons.emailIcon,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 7.h),
                      PasswordTextField(
                        hintText: "Password",
                        onSubmitted: (v) {
                          UtilityFunctions.fieldFocusChange(
                            context,
                            _passwordFocusNode,
                            _confirmPasswordFocusNode,
                          );
                        },
                        focusNode: _passwordFocusNode,
                        show: context
                            .watch<AuthProvider>()
                            .registerPasswordVisibility,
                        textEditingController: _passwordController,
                        passwordShowOnTap: () {
                          context
                              .read<AuthProvider>()
                              .changeRegisterPasswordVisibility();
                        },
                      ),
                      SizedBox(height: 7.h),
                      PasswordTextField(
                        hintText: "Confirm Password",
                        onSubmitted: (v) {
                          _confirmPasswordFocusNode.unfocus();
                        },
                        focusNode: _confirmPasswordFocusNode,
                        show: context
                            .watch<AuthProvider>()
                            .registerConfirmPasswordVisibility,
                        textEditingController: _confirmPasswordController,
                        passwordShowOnTap: () {
                          context
                              .read<AuthProvider>()
                              .changeRegisterConfirmPasswordVisibility();
                        },
                      ),
                      SizedBox(height: 32.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 52.w),
                        child: CustomTextButton(
                          title: "SIGNUP",
                          onPressed: () {
                            String firstName = _firstNameController.text;
                            String lastName = _lastNameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword =
                                _confirmPasswordController.text;
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email);
                            if (firstName.length <= 2) {
                              UtilityFunctions.getMyToast(
                                message:
                                    "First name must be minimum 3 characters",
                                context: context,
                              );
                            } else if (lastName.length <= 2) {
                              UtilityFunctions.getMyToast(
                                message:
                                    "Last name must be minimum 3 characters",
                                context: context,
                              );
                            } else if (password.length <= 5) {
                              UtilityFunctions.getMyToast(
                                message: "Password must be minimum 6 symbols",
                                context: context,
                              );
                            } else if (password != confirmPassword) {
                              UtilityFunctions.getMyToast(
                                message:
                                    "Password and confirm\npassword is not similar",
                                context: context,
                              );
                            } else if (!emailValid) {
                              UtilityFunctions.getMyToast(
                                message: "Email is wrong",
                                context: context,
                              );
                            } else {
                              context.read<AuthProvider>().registerUser(
                                    firstName: firstName,
                                    lastName: lastName,
                                    email: email,
                                    password: password,
                                  );
                              UtilityFunctions.getMyToast(
                                  message: "Let's login", context: context);
                              Navigator.pushReplacementNamed(
                                context,
                                RouteNames.login,
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 22.h),
                      SimpleTextButton(
                        title: "Already have an account? Login",
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RouteNames.login);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
