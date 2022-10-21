import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSquareButton extends StatelessWidget {
  const CustomSquareButton(
      {super.key, required this.onPressed, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: SvgPicture.asset(
          iconPath,
          height: 24,
          width: 24,
          color: Theme.of(context).hintColor,
        ),
      ),
    );
  }

  final VoidCallback onPressed;
  final String iconPath;
}
