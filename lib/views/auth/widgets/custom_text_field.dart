import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/my_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.onSubmitted,
    required this.focusNode,
    required this.textEditingController,
    required this.hintText,
    required this.prefixIcon,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 33.w, right: 39.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            spreadRadius: 5,
            blurRadius: 5,
            color: Theme.of(context).primaryColor == Colors.white
                ? Colors.grey.shade300
                : Colors.transparent,
            offset: const Offset(1, 3),
          )
        ],
      ),
      child: TextField(
        controller: textEditingController,
        cursorColor: Theme.of(context).hintColor,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        keyboardType: textInputType,
        style: MyFonts.w400.copyWith(fontSize: 14.sp),
        decoration: InputDecoration(
          hoverColor: Theme.of(context).hintColor,
          hintText: hintText,
          hintStyle: MyFonts.w400.copyWith(
            fontSize: 14.sp,
            color: Theme.of(context).hintColor,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 13.h),
          fillColor: Theme.of(context).primaryColor,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 9,
            ),
            child: SvgPicture.asset(
              prefixIcon,
              color: Theme.of(context).hintColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final String hintText;
  final String prefixIcon;
  final TextInputType textInputType;
  final ValueChanged<String> onSubmitted;
}
