import 'package:banking_app/providers/auth_provider.dart';
import 'package:banking_app/utils/my_fonts.dart';
import 'package:banking_app/utils/my_icons.dart';
import 'package:banking_app/views/welcome/widgets/lang_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../constants/route_names.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late final Animation<double> scaleAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    scaleAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn,
    );
    context.read<AuthProvider>().animateOpacityWelcomeScreen();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Expanded(
                child: ScaleTransition(
                    scale: scaleAnimation,
                    child: Lottie.asset(MyIcons.welcomeAnimation)),
              ),
              SizedBox(height: 50.h),
              Expanded(
                child: AnimatedOpacity(
                  opacity: context.watch<AuthProvider>().animateOpacity ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 600),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to",
                        style: MyFonts.w700.copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Azorbank",
                        style: MyFonts.w700.copyWith(fontSize: 30.sp),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Choose app language",
                        style: MyFonts.w500.copyWith(fontSize: 16.sp),
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LangButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.regist);
                              },
                              langName: "UZ",
                              flagPath: MyIcons.uzFlagIcon,
                              flagHeight: 20,
                            ),
                            LangButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.regist);
                              },
                              langName: "EN",
                              flagPath: MyIcons.ukFlagIcon,
                              flagHeight: 25,
                            ),
                            LangButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.regist);
                              },
                              langName: "RU",
                              flagPath: MyIcons.ruFlagIcon,
                              flagHeight: 25,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
