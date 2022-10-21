import 'package:banking_app/utils/my_colors.dart';
import 'package:flutter/material.dart';

class PinDote extends StatelessWidget {
  const PinDote({
    super.key,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 12,
      width: 12,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: active ? MyColors.c32D74B : Theme.of(context).primaryColorLight,
        shape: BoxShape.circle,
      ),
    );
  }

  final bool active;
}
