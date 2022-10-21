import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_icons.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: "googleButton",
            elevation: 0.0,
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Image.asset(MyIcons.googleIcon),
          ),
          FloatingActionButton(
            heroTag: "appleButton",
            elevation: 0.0,
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Image.asset(MyIcons.appleIcon),
          ),
          FloatingActionButton(
            heroTag: "facebookButton",
            elevation: 0.0,
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Image.asset(MyIcons.facebookIcon),
          ),
        ],
      ),
    );
  }
}
