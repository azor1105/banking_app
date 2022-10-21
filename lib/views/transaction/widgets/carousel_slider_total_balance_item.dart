import 'package:banking_app/providers/transactions_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_credit_card_provider.dart';
import '../../../utils/my_fonts.dart';
import '../../../utils/my_icons.dart';

class CarouselSliderTotalBalanceItem extends StatelessWidget {
  const CarouselSliderTotalBalanceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, transactions, child) => CarouselSlider.builder(
        itemCount: transactions.selectedTransactiosnOnTransactionScreen.length,
        itemBuilder: (context, index, realIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                MyIcons.sumIcon,
                height: 25,
                color: Colors.black,
              ),
              SizedBox(width: 5.w),
              Text(
                context.read<UserCreditCardProvider>().formatCurrency(
                      moneyAmount: transactions.isExpense
                          ? transactions.getTotalExpenseInDataWithIndex(index)
                          : transactions.getTotalIncomeInDataWithIndex(index),
                    ),
                style: MyFonts.w700.copyWith(fontSize: 28.sp),
              ),
            ],
          );
        },
        options: CarouselOptions(
            height: 40,
            viewportFraction: 0.55,
            aspectRatio: 8,
            enlargeCenterPage: true,
            onPageChanged: (index, covariant) {
              transactions.changeValueRealIndex(index: index);
            }),
      ),
    );
  }
}
