
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/background.svg',
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.fill,
        ),
        child
      ],
    );
  }
}
