import 'package:banking_app/data/models/transactions/universal/universal_transaction_model_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_credit_card_provider.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';
import '../../../utils/my_icons.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
              imageUrl: transaction.imageUrl,
              height: 48,
            ),
          ),
          SizedBox(width: 11.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.name,
                style: MyFonts.w600.copyWith(fontSize: 16.sp),
              ),
              SizedBox(height: 4.h),
              Text(
                transaction.typeName,
                style: MyFonts.w400.copyWith(
                  fontSize: 14.sp,
                  color: MyColors.c8E8E93,
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "${transaction.isExpense ? "- " : ""}${context.read<UserCreditCardProvider>().formatCurrency(moneyAmount: transaction.amount)}",
                    style: MyFonts.w600.copyWith(
                      fontSize: 16.sp,
                      color: transaction.isExpense
                          ? Theme.of(context).hintColor
                          : MyColors.c32D74B,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Image.asset(
                    MyIcons.sumIcon,
                    height: 12,
                    color: transaction.isExpense
                        ? Theme.of(context).hintColor
                        : MyColors.c32D74B,
                  )
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                DateFormat.jm().format(transaction.dateTime),
                style: MyFonts.w400.copyWith(
                  fontSize: 14.sp,
                  color: MyColors.c8E8E93,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  final UniversalTransactionDataModel transaction;
}
