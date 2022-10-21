import 'package:banking_app/constants/route_names.dart';
import 'package:banking_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/auth_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var authState = context.watch<AuthProvider>().authState;
    navigateToScreen(authState);
    return const Scaffold();
  }

  Future<void> navigateToScreen(AuthState authState) async {
    switch (authState) {
      case AuthState.registered:
        Future.microtask(
          () => Navigator.pushReplacementNamed(context, RouteNames.login),
        );
        break;
      case AuthState.logged:
        Future.microtask(
          () => Navigator.pushReplacementNamed(context, RouteNames.security),
        );
        break;
      case AuthState.notRegistered:
        Future.microtask(
          () => Navigator.pushReplacementNamed(context, RouteNames.welcome),
        );
        break;
      case AuthState.start:
        break;
    }
  }
}
