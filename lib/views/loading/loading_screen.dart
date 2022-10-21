import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../utils/my_fonts.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCube(
              color: Theme.of(context).hintColor,
              size: 60,
            ),
            const SizedBox(height: 50),
            Text(
              "Loading",
              style: MyFonts.w700
                  .copyWith(fontSize: 20, color: Theme.of(context).hintColor),
            ),
          ],
        ),
      ),
    );
  }
}
