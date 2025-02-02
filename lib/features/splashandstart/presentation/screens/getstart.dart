import 'package:flutter/material.dart';

import '../../../../util/responsive/responsivegetstart.dart';
import '../layouts/desktop/getStartedDesktopLayout.dart';
import '../layouts/mobile/mobilegetstartlayout.dart';

class Getstart extends StatelessWidget {
  const Getstart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: startScreenResponsiveBuilder(
            getstartmobileViewLayout: (context) => getstartmobileViewLayout(),
            getStartTabletlayout: (context) => getStartedDesktopLayout(),
            getStartedDesktopLayout: (context) => getStartedDesktopLayout()));
  }
}
