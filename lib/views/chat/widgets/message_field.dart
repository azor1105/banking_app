import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';

class MessageField extends StatelessWidget {
  const MessageField({
    super.key,
    required this.onChanged,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        style: MyFonts.w600.copyWith(
          fontSize: 16.sp,
          color: Theme.of(context).hintColor,
        ),
        onChanged: onChanged,
        controller: messageController,
        decoration: InputDecoration(
          hintText: "Type here...",
          hintStyle: MyFonts.w600.copyWith(
            fontSize: 20.sp,
            color: MyColors.c636366,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  final ValueChanged<String> onChanged;
  final TextEditingController messageController;
}
