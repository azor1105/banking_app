import 'package:banking_app/data/models/transactions/universal/universal_transaction_model_data.dart';
import 'package:banking_app/providers/transactions_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/my_fonts.dart';

class MonthlyTransactionDiagramItem extends StatelessWidget {
  const MonthlyTransactionDiagramItem({
    super.key,
    required this.showOpacity,
    required this.dateTime,
    required this.transactions,
    required this.totalBalanceOfData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Opacity(
        opacity: showOpacity ? 1.0 : 0.4,
        child: Column(children: [
          ...List.generate(
            transactions.length,
            (indexOfData) => Expanded(
              flex: ((transactions[indexOfData].amount / totalBalanceOfData) *
                      100)
                  .toInt(),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 1.h),
                width: 48.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: context
                      .read<TransactionProvider>()
                      .getHexColorOfTransactionType(
                        transactions[indexOfData].transactionTypeId,
                      ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            DateFormat.LLL().format(
              dateTime,
            ),
            style: MyFonts.w400.copyWith(fontSize: 14.sp),
          ),
        ]),
      ),
    );
  }

  final bool showOpacity;
  final DateTime dateTime;
  final List<UniversalTransactionDataModel> transactions;
  final double totalBalanceOfData;
}
