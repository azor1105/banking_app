import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';

class TransactionSwitchButton extends StatelessWidget {
  const TransactionSwitchButton({
    super.key,
    required this.isExpense,
    required this.incomePressed,
    required this.expensePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: expensePressed,
            child: Container(
              width: 166.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: !isExpense
                    ? Theme.of(context).bottomNavigationBarTheme.backgroundColor
                    : null,
                borderRadius: BorderRadius.circular(12.r),
                gradient: isExpense
                    ? LinearGradient(
                        colors: MyColors.transactionChooseButtonColors,
                      )
                    : null,
              ),
              child: Center(
                child: Text(
                  "Expense",
                  style: MyFonts.w600.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: incomePressed,
            child: Container(
              width: 166.w,
              height: 44.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: !isExpense
                    ? null
                    : Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                gradient: !isExpense
                    ? LinearGradient(
                        colors: MyColors.transactionChooseButtonColors,
                      )
                    : null,
              ),
              child: Center(
                child: Text(
                  "Income",
                  style: MyFonts.w600.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final VoidCallback incomePressed;
  final VoidCallback expensePressed;
  final bool isExpense;
}
