import 'package:banking_app/data/models/transactions/universal/universal_transaction_model_data.dart';
import 'package:banking_app/providers/transactions_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_credit_card_provider.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';
import '../../../utils/my_icons.dart';

class MonthlyTransactionInfoItem extends StatelessWidget {
  const MonthlyTransactionInfoItem({
    super.key,
    required this.flex,
    required this.selectedTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      width: double.infinity,
      height: 72.h,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(
              imageUrl: context
                  .read<TransactionProvider>()
                  .getImageOfTransactionType(
                      selectedTransaction.transactionTypeId),
              height: 48,
              width: 48,
            ),
          ),
          SizedBox(width: 11.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedTransaction.typeName,
                      style: MyFonts.w600.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${context.read<TransactionProvider>().isExpense ? "- " : ""}${context.read<UserCreditCardProvider>().formatCurrency(moneyAmount: selectedTransaction.amount)}",
                          style: MyFonts.w600.copyWith(
                            fontSize: 16.sp,
                            color: context.read<TransactionProvider>().isExpense
                                ? Theme.of(context).hintColor
                                : MyColors.c32D74B,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        Image.asset(
                          MyIcons.sumIcon,
                          height: 12,
                          color: context.read<TransactionProvider>().isExpense
                              ? Theme.of(context).hintColor
                              : MyColors.c32D74B,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 11.h),
                Container(
                  height: 4.h,
                  width: 284.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: flex.ceil(),
                        child: Container(
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: context
                                .read<TransactionProvider>()
                                .getHexColorOfTransactionType(
                                    selectedTransaction.transactionTypeId),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 100 - flex.toInt(), child: const SizedBox()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final double flex;
  final UniversalTransactionDataModel selectedTransaction;
}
