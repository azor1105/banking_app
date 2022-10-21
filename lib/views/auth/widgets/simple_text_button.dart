import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/my_fonts.dart';

class SimpleTextButton extends StatelessWidget {
  const SimpleTextButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        primary: Colors.grey,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: MyFonts.w400.copyWith(
          color: Theme.of(context).hintColor,
          fontSize: 12.sp,
        ),
      ),
    );
  }

  final String title;
  final VoidCallback onPressed;
}

