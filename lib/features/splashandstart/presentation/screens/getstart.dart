import 'package:flutter/material.dart';

import '../layouts/desktop/getStartedDesktopLayout.dart';
import '../layouts/mobile/mobilegetstartlayout.dart';

class Getstart extends StatelessWidget {
  const Getstart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constrains) {
      print(constrains.maxWidth);
      if (constrains.maxWidth >= 800) {
        return getStartedDesktopLayout();
      } else {
        return getstartmobileViewLayout();
      }
    }));
  }
}
