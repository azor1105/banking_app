import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/my_fonts.dart';

class LangButton extends StatelessWidget {
  const LangButton({
    super.key,
    required this.onPressed,
    required this.langName,
    required this.flagPath,
    required this.flagHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      )),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Row(
          children: [
            Image.asset(flagPath, height: flagHeight),
            SizedBox(width: 10.w),
            Text(
              langName,
              style: MyFonts.w600.copyWith(fontSize: 19.sp),
            ),
          ],
        ),
      ),
    );
  }

  final String langName;
  final String flagPath;
  final double flagHeight;
  final VoidCallback onPressed;
}
