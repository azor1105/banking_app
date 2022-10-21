import 'package:banking_app/constants/route_names.dart';
import 'package:banking_app/views/auth/login/login_screen.dart';
import 'package:banking_app/views/auth/regist/regist_screen.dart';
import 'package:banking_app/views/cards/cards_screen.dart';
import 'package:banking_app/views/home/home_screen.dart';
import 'package:banking_app/views/security/security_screen.dart';
import 'package:banking_app/views/splash/splash_screen.dart';
import 'package:banking_app/views/tab_box/tab_box_screen.dart';
import 'package:banking_app/views/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.tabBox:
        return MaterialPageRoute(
          builder: (_) => const TabBoxScreen(),
        );
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case RouteNames.cards:
        return MaterialPageRoute(
          builder: (_) => const CardsScreen(),
        );
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RouteNames.welcome:
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case RouteNames.security:
        return MaterialPageRoute(
          builder: (_) => const SecurityScreen(),
        );
      case RouteNames.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case RouteNames.regist:
        return MaterialPageRoute(
          builder: (_) => const RegistScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("404 page not found"),
            ),
          ),
        );
    }
  }
}
