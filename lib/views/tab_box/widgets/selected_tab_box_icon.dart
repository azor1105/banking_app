import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedTabBoxIcon extends StatelessWidget {
  const SelectedTabBoxIcon({
    super.key,
    required this.colors,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 107,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(iconPath),
      ),
    );
  }

  final List<Color> colors;
  final String iconPath;
}
