import 'package:banking_app/constants/route_names.dart';
import 'package:banking_app/data/repositories/auth_repository.dart';
import 'package:banking_app/data/repositories/transactions_repository.dart';
import 'package:banking_app/data/repositories/user_credit_card_repository.dart';
import 'package:banking_app/data/services/open_api_services.dart';
import 'package:banking_app/data/services/secure_api_services.dart';
import 'package:banking_app/providers/auth_provider.dart';
import 'package:banking_app/providers/chat_provider.dart';
import 'package:banking_app/providers/pin_provider.dart';
import 'package:banking_app/providers/transactions_provider.dart';
import 'package:banking_app/providers/user_credit_card_provider.dart';
import 'package:banking_app/utils/my_themes.dart';
import 'package:banking_app/views/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(
            transactionsRepo: TransactionsRepository(
              secureApiService: SecureApiServices(),
              openApiService: OpenApiServices(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => UserCreditCardProvider(
            userCreditCardRepository: UserCreditCardRepository(
              secureApiServices: SecureApiServices(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(
            authRepository: AuthRepository(
              openApiServices: OpenApiServices(),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => PinProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          themeMode: ThemeMode.system,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteNames.splash,
          onGenerateRoute: Routes.generateRoute,
        );
      },
    );
  }
}
// flutter pub run build_runner build --delete-conflicting-outputs ----> Magic command