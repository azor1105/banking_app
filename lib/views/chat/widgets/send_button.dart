import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_icons.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.visible,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 48,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: MyColors.sendButtonColors,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(MyIcons.sendIcon),
          ),
        ),
      ),
    );
  }

  final bool visible;
  final VoidCallback onTap;
}
