import 'package:banking_app/providers/transactions_provider.dart';
import 'package:banking_app/utils/my_colors.dart';
import 'package:banking_app/utils/my_fonts.dart';
import 'package:banking_app/views/transaction/widgets/carousel_slider_total_balance_item.dart';
import 'package:banking_app/views/transaction/widgets/monthly_transaction_info_item.dart';
import 'package:banking_app/views/transaction/widgets/monthly_transaction_item.dart';
import 'package:banking_app/views/transaction/widgets/transaction_switch_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TransActionScreen extends StatefulWidget {
  const TransActionScreen({super.key});

  @override
  State<TransActionScreen> createState() => _TransActionScreenState();
}

class _TransActionScreenState extends State<TransActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<TransactionProvider>(
          builder: (context, transactions, child) {
            return transactions.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TransactionSwitchButton(
                        isExpense: transactions.isExpense,
                        incomePressed: () {
                          transactions.changeValueIsExpense(value: false);
                          transactions
                              .changeSelectedTransactionsOnTransactionScreen();
                        },
                        expensePressed: () {
                          transactions.changeValueIsExpense(value: true);
                          transactions
                              .changeSelectedTransactionsOnTransactionScreen();
                        },
                      ),
                      SizedBox(
                        height: 272.h,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(16),
                          scrollDirection: Axis.horizontal,
                          itemCount: transactions
                              .selectedTransactiosnOnTransactionScreen.length,
                          itemBuilder: (context, index) {
                            double totalBalanceOfData = transactions.isExpense
                                ? transactions
                                    .getTotalExpenseInDataWithIndex(index)
                                : transactions
                                    .getTotalIncomeInDataWithIndex(index);
                            return MonthlyTransactionDiagramItem(
                              showOpacity: transactions.realIndex == index,
                              dateTime: transactions
                                  .selectedTransactiosnOnTransactionScreen[
                                      index]
                                  .dateTimeOfTransactions,
                              transactions: transactions
                                  .selectedTransactiosnOnTransactionScreen[
                                      index]
                                  .data,
                              totalBalanceOfData: totalBalanceOfData,
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Center(
                        child: Text(
                          transactions.isExpense
                              ? "Total expenses"
                              : "Total incomes",
                          style: MyFonts.w400.copyWith(
                            fontSize: 16.sp,
                            color: MyColors.c8E8E93,
                          ),
                        ),
                      ),
                      const CarouselSliderTotalBalanceItem(),
                      SizedBox(height: 16.h),
                      Expanded(
                        child: ListView.builder(
                          itemCount: transactions
                              .selectedTransactiosnOnTransactionScreen[
                                  transactions.realIndex]
                              .data
                              .length,
                          itemBuilder: (context, index) {
                            var selectedTransaction = transactions
                                .selectedTransactiosnOnTransactionScreen[
                                    transactions.realIndex]
                                .data[index];
                            double flex = (selectedTransaction.amount /
                                    (transactions.isExpense
                                        ? transactions
                                            .getTotalExpenseInDataWithIndex(
                                                transactions.realIndex)
                                        : transactions
                                            .getTotalIncomeInDataWithIndex(
                                                transactions.realIndex))) *
                                100;
                            return MonthlyTransactionInfoItem(
                              flex: flex,
                              selectedTransaction: selectedTransaction,
                            );
                          },
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
