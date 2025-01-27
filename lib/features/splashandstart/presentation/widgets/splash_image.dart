import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';

class splashImage extends StatelessWidget {
  final double heigth;
  final double width;
  const splashImage({
    super.key,
    required this.heigth,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      MyAssets.Splash,
      width: width, // Adjust the width to control the image size
      height: heigth, // Adjust the height to control the image size
    );
  }
}
