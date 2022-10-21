import 'package:flutter/material.dart';

class PinButton extends StatelessWidget {
  const PinButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        primary: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }

  final Widget child;
  final VoidCallback onPressed;
}
