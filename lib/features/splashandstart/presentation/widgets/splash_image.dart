import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';

class splashImage extends StatelessWidget {
  const splashImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      MyAssets.Splash,
      fit: BoxFit.fitHeight,
    );
  }
}
