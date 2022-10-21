import 'package:banking_app/utils/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/my_fonts.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    required this.hintText,
    required this.onSubmitted,
    required this.focusNode,
    super.key,
    required this.show,
    required this.textEditingController,
    required this.passwordShowOnTap,
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
        focusNode: focusNode,
        onSubmitted: onSubmitted,
        obscureText: show == false,
        keyboardType: TextInputType.text,
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
              MyIcons.passwordIcon,
              color: Theme.of(context).hintColor,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 15.h),
            child: GestureDetector(
              onTap: passwordShowOnTap,
              child: Image.asset(
                show ? MyIcons.passwordShowIcon : MyIcons.passwordHideIcon,
                color: Theme.of(context).hintColor,
                height: 10,
              ),
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

  final TextEditingController textEditingController;
  final bool show;
  final VoidCallback passwordShowOnTap;
  final ValueChanged<String> onSubmitted;
  final FocusNode focusNode;
  final String hintText;
}
