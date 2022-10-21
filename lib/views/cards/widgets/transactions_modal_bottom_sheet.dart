import 'package:banking_app/views/cards/widgets/title_of_transactions_list_modal_bottom_sheet.dart';
import 'package:banking_app/views/cards/widgets/transation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../providers/transactions_provider.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';

dynamic transactionModalBottomSheet({
  required BuildContext context,
  required AnimationController animationController,
}) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(24),
      ),
    ),
    barrierColor: Colors.transparent,
    transitionAnimationController: animationController,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.78,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24.r),
          ),
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleOfTransactionsListBottomSheet(),
            Expanded(
              child: Consumer<TransactionProvider>(
                  builder: (context, transactions, child) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: transactions.universalItems.length,
                  itemBuilder: (context, index) {
                    DateFormat monthFormatter = DateFormat.LLL();
                    DateFormat dayFormatter = DateFormat.d();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 76, top: 8, bottom: 8),
                          child: Text(
                            "${dayFormatter.format(transactions.universalItems[index].dateTimeOfTransactions)} ${monthFormatter.format(transactions.universalItems[index].dateTimeOfTransactions)}, ${transactions.universalItems[index].dateTimeOfTransactions.year}",
                            style: MyFonts.w400.copyWith(
                              fontSize: 14.sp,
                              color: MyColors.c8E8E93,
                            ),
                          ),
                        ),
                        ...List.generate(
                          transactions.universalItems[index].data.length,
                          (indexOfData) {
                            var transaction = transactions
                                .universalItems[index].data[indexOfData];
                            return TransactionItem(
                              transaction: transaction,
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      );
    },
  );
}
