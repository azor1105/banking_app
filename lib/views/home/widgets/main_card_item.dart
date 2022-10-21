import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';
import '../../../utils/my_icons.dart';

class MainCardItem extends StatelessWidget {
  const MainCardItem({
    super.key,
    required this.onTapToMainCard,
    required this.totalBalance,
    required this.expense,
    required this.income,
    required this.cardExpireDate,
    required this.cardNumber,
    required this.cardBalance,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 234,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total balance",
                    style: MyFonts.w400.copyWith(
                      fontSize: 16.sp,
                      color: MyColors.c8E8E93,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(
                        MyIcons.sumIcon,
                        height: 25,
                        color: Theme.of(context).hintColor,
                      ),
                      SizedBox(width: 10.h),
                      Text(
                        totalBalance,
                        style: MyFonts.w700.copyWith(
                          fontSize: 32.sp,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "This month",
                    style: MyFonts.w400.copyWith(
                      fontSize: 16.sp,
                      color: MyColors.c8E8E93,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        MyIcons.incomeIcon,
                      ),
                      SizedBox(width: 12.w),
                      Image.asset(
                        MyIcons.sumIcon,
                        height: 17,
                        color: Theme.of(context).hintColor,
                      ),
                      SizedBox(width: 7.w),
                      Text(
                        income,
                        style: MyFonts.w600.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        MyIcons.expenseIcon,
                      ),
                      SizedBox(width: 12.w),
                      Image.asset(
                        MyIcons.sumIcon,
                        height: 17,
                        color: Theme.of(context).hintColor,
                      ),
                      SizedBox(width: 7.w),
                      Text(
                        expense,
                        style: MyFonts.w600.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 46.w),
              SizedBox(
                height: 234,
                width: 351,
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      bottom: 0,
                      child: Container(
                        width: 311,
                        height: 214,
                        decoration: BoxDecoration(
                            color: const Color(0xFF655CE0),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Container(
                        width: 331,
                        height: 214,
                        decoration: BoxDecoration(
                            color: const Color(0xFFF79613),
                            borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 20,
                      child: GestureDetector(
                        onTap: onTapToMainCard,
                        child: Container(
                          padding: const EdgeInsets.all(22),
                          width: 351,
                          height: 214,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF3DD14A),
                                  Color(0xFFECD416),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Main card",
                                    style: MyFonts.w600.copyWith(
                                      fontSize: 20.sp,
                                      color: MyColors.black,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  SvgPicture.asset(
                                    MyIcons.nfcIcon,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(MyIcons.googlePayIcon)
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    cardNumber,
                                    style: MyFonts.w400.copyWith(
                                      fontSize: 16.sp,
                                      color: MyColors.black,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    MyIcons.cardTouchIcon,
                                    color: MyColors.black,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${cardExpireDate.month > 9 ? cardExpireDate.month : "0${cardExpireDate.month}"} / ${(cardExpireDate.year.toString()).substring(2, cardExpireDate.year.toString().length)}",
                                style: MyFonts.w400.copyWith(
                                  fontSize: 16.sp,
                                  color: MyColors.black,
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                              Row(
                                children: [
                                  Image.asset(
                                    MyIcons.sumIcon,
                                    height: 25,
                                    color: MyColors.black,
                                  ),
                                  SizedBox(width: 10.h),
                                  Text(
                                    cardBalance,
                                    style: MyFonts.w700.copyWith(
                                        fontSize: 32.sp, color: MyColors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  final VoidCallback onTapToMainCard;
  final String totalBalance;
  final String expense;
  final String income;
  final DateTime cardExpireDate;
  final String cardNumber;
  final String cardBalance;
}
