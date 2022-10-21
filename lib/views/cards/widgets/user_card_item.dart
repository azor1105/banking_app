import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';
import '../../../utils/my_icons.dart';

class UserCardItem extends StatelessWidget {
  const UserCardItem({
    super.key,
    required this.height,
    required this.gradientColors,
    required this.bankName,
    required this.cardNumber,
    required this.cardBalance,
    required this.cardExpireDate,
    required this.cardSystemImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                bankName,
                style: MyFonts.w600.copyWith(
                  fontSize: 20.sp,
                  color: MyColors.white,
                ),
              ),
              const Expanded(child: SizedBox()),
              SvgPicture.asset(MyIcons.nfcIcon),
              const SizedBox(width: 10),
              Image.asset(MyIcons.googlePayIcon),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardNumber,
                style: MyFonts.w400
                    .copyWith(fontSize: 16.sp, color: MyColors.white),
              ),
              height == MediaQuery.of(context).size.height *0.3
                  ? SvgPicture.asset(MyIcons.cardTouchIcon)
                  : CachedNetworkImage(
                      imageUrl: cardSystemImage,
                      height: 24,
                    ),
            ],
          ),
          height == MediaQuery.of(context).size.height *0.3
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      "${cardExpireDate.month > 9 ? cardExpireDate.month : "0${cardExpireDate.month}"} / ${(cardExpireDate.year.toString()).substring(2, cardExpireDate.year.toString().length)}",
                      style: MyFonts.w400.copyWith(
                        fontSize: 16.sp,
                        color: MyColors.white,
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          height == MediaQuery.of(context).size.height *0.3 ? const Expanded(child: SizedBox()) : const SizedBox(),
          height == MediaQuery.of(context).size.height *0.3
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          MyIcons.sumIcon,
                          height: 25,
                          color: MyColors.white,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.42,
                          child: Text(
                            cardBalance,
                            style: MyFonts.w700.copyWith(
                              fontSize: 32.sp,
                              overflow: TextOverflow.ellipsis,
                              color: MyColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CachedNetworkImage(
                      imageUrl: cardSystemImage,
                      height: 24,
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  final String bankName;
  final double height;
  final String cardNumber;
  final String cardBalance;
  final DateTime cardExpireDate;
  final String cardSystemImage;
  final List<Color> gradientColors;
}
