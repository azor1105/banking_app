import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/my_fonts.dart';
import '../../../utils/my_icons.dart';

class HistoryTransactionsShowItem extends StatelessWidget {
  const HistoryTransactionsShowItem({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 28.w),
          child: Row(
            children: [
              SvgPicture.asset(
                MyIcons.upIcon,
                color: Theme.of(context).hintColor,
              ),
              SizedBox(width: 23.w),
              Text(
                "History transactions",
                style: MyFonts.w600.copyWith(
                  fontSize: 20.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final VoidCallback onTap;
}
