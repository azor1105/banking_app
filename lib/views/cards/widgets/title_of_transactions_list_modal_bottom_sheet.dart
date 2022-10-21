import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/my_fonts.dart';
import '../../../utils/my_icons.dart';
import '../../home/widgets/custom_square_button.dart';

class TitleOfTransactionsListBottomSheet extends StatelessWidget {
  const TitleOfTransactionsListBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 15, right: 16, left: 28),
      child: Row(
        children: [
          SvgPicture.asset(
            MyIcons.downIcon,
            color: Theme.of(context).hintColor,
          ),
          SizedBox(width: 11.w),
          Text(
            "Learn it",
            style: MyFonts.w600.copyWith(fontSize: 20.sp),
          ),
          const Expanded(child: SizedBox()),
          CustomSquareButton(
            onPressed: () {},
            iconPath: MyIcons.searchIcon,
          ),
          SizedBox(width: 11.w),
          CustomSquareButton(
            onPressed: () {},
            iconPath: MyIcons.calendarIcon,
          ),
        ],
      ),
    );
  }
}
