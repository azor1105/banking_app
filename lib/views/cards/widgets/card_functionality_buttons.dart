import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/my_icons.dart';
import '../../home/widgets/custom_rectangle_button.dart';

class CardFunctionalityButtons extends StatelessWidget {
  const CardFunctionalityButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRectangleButton(
                nameOfButton: "Change PIN",
                iconPath: MyIcons.changePinIcon,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRectangleButton(
                nameOfButton: "Freeze card",
                iconPath: MyIcons.freezeCardIcon,
                onPressed: () {},
              ),
              CustomRectangleButton(
                nameOfButton: "Customize",
                iconPath: MyIcons.customizeIcon,
                onPressed: () {},
              ),
              CustomRectangleButton(
                nameOfButton: "Manage",
                iconPath: MyIcons.manageIcon,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
