import 'package:banking_app/extensions/color_extension.dart';
import 'package:banking_app/providers/user_credit_card_provider.dart';
import 'package:banking_app/utils/my_fonts.dart';
import 'package:banking_app/utils/my_icons.dart';
import 'package:banking_app/views/cards/widgets/card_functionality_buttons.dart';
import 'package:banking_app/views/cards/widgets/transactions_history_show_item.dart';
import 'package:banking_app/views/cards/widgets/transactions_modal_bottom_sheet.dart';
import 'package:banking_app/views/cards/widgets/user_card_item.dart';
import 'package:banking_app/views/home/widgets/custom_square_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/my_colors.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen>
    with SingleTickerProviderStateMixin {
  int activeIndex = 0;
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..addListener(() {
      setState(() {});
    });
  late final Animation heightAnimationOfCard =
      Tween<double>(begin: MediaQuery.of(context).size.height*0.3, end: MediaQuery.of(context).size.height*0.15).animate(_animationController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Tween<double>(begin: 50.0, end: 0.0)
            .animate(_animationController)
            .value),
        child: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0.0,
          title: Text(
            "My cards",
            style: MyFonts.w600.copyWith(
              fontSize: 20.sp,
              color: Theme.of(context).hintColor,
            ),
          ),
          leading: Center(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: SvgPicture.asset(
                  MyIcons.arrowBackIcon,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          ),
          actions: [
            Center(
              child: CustomSquareButton(
                  onPressed: () {}, iconPath: MyIcons.addCardIcon),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
      body: Consumer<UserCreditCardProvider>(
        builder: (context, userCards, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            CarouselSlider.builder(
              itemCount: userCards.userCreditCards.length,
              itemBuilder: (context, index, realIndex) {
                final cardItem = userCards.userCreditCards[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: UserCardItem(
                    height: heightAnimationOfCard.value,
                    gradientColors: [
                      HexColor.fromHex(cardItem.cardGradienColors.colorA),
                      HexColor.fromHex(cardItem.cardGradienColors.colorB),
                    ],
                    bankName: cardItem.bankName,
                    cardNumber: cardItem.cardNumber,
                    cardBalance: context
                        .read<UserCreditCardProvider>()
                        .formatCurrency(moneyAmount: cardItem.moneyAmount),
                    cardExpireDate: DateTime.parse(cardItem.expireDate),
                    cardSystemImage: cardItem.iconImage,
                  ),
                );
              },
              options: CarouselOptions(
                height: heightAnimationOfCard.value,
                onPageChanged: (index, covariant) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            SizedBox(height: 34.h),
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: context
                    .read<UserCreditCardProvider>()
                    .userCreditCards
                    .length,
                effect: SlideEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  dotColor: Theme.of(context).primaryColorLight,
                  activeDotColor: MyColors.c32D74B,
                ),
              ),
            ),
            SizedBox(height: 34.h),
            const CardFunctionalityButtons(),
            const Expanded(child: SizedBox()),
            HistoryTransactionsShowItem(onTap: () {
              transactionModalBottomSheet(
                context: context,
                animationController: _animationController,
              );
            }),
          ],
        ),
      ),
    );
  }
}
