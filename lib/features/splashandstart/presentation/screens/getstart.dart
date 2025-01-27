import 'package:flutter/material.dart';

import '../layouts/desktop/getStartedDesktopLayout.dart';
import '../layouts/mobile/mobilegetstartlayout.dart';
import '../layouts/tablet/getstarttable.dart';

class Getstart extends StatelessWidget {
  const Getstart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constrains) {
      print(constrains.maxWidth);
      if (constrains.maxWidth < 600) {
        return getstartmobileViewLayout();
      } else if (constrains.maxWidth < 1200) {
        return getStartTabletlayout();
      } else {
        return getStartedDesktopLayout();
      }
    }));
  }
}
