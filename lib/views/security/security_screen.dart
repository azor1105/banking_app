import 'package:banking_app/constants/route_names.dart';
import 'package:banking_app/providers/pin_provider.dart';
import 'package:banking_app/utils/my_fonts.dart';
import 'package:banking_app/utils/my_icons.dart';
import 'package:banking_app/utils/utility_functions.dart';
import 'package:banking_app/views/auth/widgets/simple_text_button.dart';
import 'package:banking_app/views/security/widgets/pin_button.dart';
import 'package:banking_app/views/security/widgets/pin_dote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    int lengthEnteredPassword =
        context.watch<PinProvider>().enteredPassword.length;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text("Security screen", style: MyFonts.w600),
              SizedBox(height: 68.h),
              Text(
                context.watch<PinProvider>().title,
                style: MyFonts.w400.copyWith(fontSize: 16.sp),
              ),
              SizedBox(height: 26.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 96.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PinDote(active: lengthEnteredPassword >= 1),
                    PinDote(active: lengthEnteredPassword >= 2),
                    PinDote(active: lengthEnteredPassword >= 3),
                    PinDote(active: lengthEnteredPassword == 4),
                  ],
                ),
              ),
              SizedBox(height: 64.h),
              GridView.count(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 43,
                mainAxisSpacing: 16,
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                children: List.generate(
                  9,
                  (index) => PinButton(
                    onPressed: () async {
                      bool? navigate =
                          await context.read<PinProvider>().enterPassword(
                                symbol: (index + 1).toString(),
                                deleteLastSymbol: false,
                                context: context,
                              );
                      setState(() {});
                      navigateToHome(navigate: navigate, context: context);
                    },
                    child: Text(
                      (index + 1).toString(),
                      style: MyFonts.w300.copyWith(
                        fontSize: 32.sp,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 85,
                      height: 85,
                      child: PinButton(
                        onPressed: () {},
                        child: SvgPicture.asset(
                          MyIcons.touchIdIcon,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 85,
                      width: 85,
                      child: PinButton(
                        onPressed: () async {
                          bool? navigate =
                              await context.read<PinProvider>().enterPassword(
                                    symbol: "0",
                                    deleteLastSymbol: false,
                                    context: context,
                                  );
                          setState(() {});
                          navigateToHome(navigate: navigate, context: context);
                        },
                        child: Text(
                          "0",
                          style: MyFonts.w300.copyWith(
                            fontSize: 32.sp,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 85,
                      width: 85,
                      child: PinButton(
                        onPressed: () {
                          context.read<PinProvider>().enterPassword(
                                symbol: "",
                                deleteLastSymbol: true,
                                context: context,
                              );
                        },
                        child: SvgPicture.asset(
                          MyIcons.backSpaceIcon,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80.h),
              SimpleTextButton(
                title: "Forgot password?",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToHome(
      {required bool? navigate, required BuildContext context}) async {
    if (navigate != null) {
      if (navigate) {
        await Future.delayed(const Duration(milliseconds: 600));
        Navigator.of(context).pushReplacementNamed(RouteNames.tabBox);
      } else {
        UtilityFunctions.getMyToast(
          message: "Passcode is wrong",
          context: context,
        );
        await Future.delayed(const Duration(milliseconds: 500));
        context.read<PinProvider>().clearEnteredPassword();
      }
    }
  }
}
