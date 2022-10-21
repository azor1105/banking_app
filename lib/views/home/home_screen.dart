import 'package:banking_app/constants/route_names.dart';
import 'package:banking_app/providers/transactions_provider.dart';
import 'package:banking_app/providers/user_credit_card_provider.dart';
import 'package:banking_app/utils/my_icons.dart';
import 'package:banking_app/views/home/widgets/custom_rectangle_button.dart';
import 'package:banking_app/views/home/widgets/custom_square_button.dart';
import 'package:banking_app/views/home/widgets/main_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _icons = [
    MyIcons.transferIcon,
    MyIcons.exchangeIcon,
    MyIcons.paymnetsIcon,
    MyIcons.creditsIcon,
    MyIcons.depositsIcon,
    MyIcons.cashbackIcon,
    MyIcons.atmIcon,
    MyIcons.securityIcon,
    MyIcons.moreIcon,
  ];

  final List<String> _titleOfIcons = [
    "Transfer",
    "Exchange",
    "Payments",
    "Credits",
    "Deposits",
    "Cashback",
    "ATM",
    "Security",
    "More",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: context.watch<UserCreditCardProvider>().isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSquareButton(
                              onPressed: () {}, iconPath: MyIcons.settingsIcon),
                          Image.asset(MyIcons.userImage),
                          CustomSquareButton(
                              onPressed: () {},
                              iconPath: MyIcons.notificationIcon),
                        ],
                      ),
                    ),
                    SizedBox(height: 26.h),
                    MainCardItem(
                      onTapToMainCard: () {
                        Navigator.pushNamed(context, RouteNames.cards);
                      },
                      totalBalance: context
                          .read<UserCreditCardProvider>()
                          .getUserTotalBalance(),
                      expense:
                          context.watch<UserCreditCardProvider>().formatCurrency(
                                moneyAmount: context
                                    .watch<TransactionProvider>()
                                    .getTotalExpenseBalance(),
                              ),
                      income:
                          context.watch<UserCreditCardProvider>().formatCurrency(
                                moneyAmount: context
                                    .watch<TransactionProvider>()
                                    .getTotalIncomeBalance(),
                              ),
                      cardExpireDate: DateTime.parse(context
                          .read<UserCreditCardProvider>()
                          .userCreditCards[0]
                          .expireDate),
                      cardNumber: context
                          .read<UserCreditCardProvider>()
                          .userCreditCards[0]
                          .cardNumber,
                      cardBalance:
                          context.read<UserCreditCardProvider>().formatCurrency(
                                moneyAmount: context
                                    .read<UserCreditCardProvider>()
                                    .userCreditCards[0]
                                    .moneyAmount,
                              ),
                    ),
                    SizedBox(height: 60.h),
                    GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 1.2,
                      physics: const ClampingScrollPhysics(),
                      crossAxisCount: 3,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      crossAxisSpacing: 11,
                      children: List.generate(
                        _icons.length,
                        (index) => CustomRectangleButton(
                          nameOfButton: _titleOfIcons[index],
                          iconPath: _icons[index],
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
            ),
      ),
    );
  }
}
