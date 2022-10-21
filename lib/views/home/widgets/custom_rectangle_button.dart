import 'package:banking_app/utils/my_colors.dart';
import 'package:banking_app/utils/my_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRectangleButton extends StatelessWidget {
  const CustomRectangleButton({
    super.key,
    required this.nameOfButton,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 44,
          width: 107,
          child: ElevatedButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )
            ),
            onPressed: onPressed,
            child: SvgPicture.asset(
              iconPath,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          nameOfButton,
          style: MyFonts.w400.copyWith(
            fontSize: 16.sp,
            color: MyColors.c8E8E93,
          ),
        )
      ],
    );
  }

  final String nameOfButton;
  final String iconPath;
  final VoidCallback onPressed;
}
