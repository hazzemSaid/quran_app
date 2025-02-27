import 'package:flutter/material.dart';

class startScreenResponsiveBuilder extends StatelessWidget {
  const startScreenResponsiveBuilder({
    super.key,
    required this.getstartmobileViewLayout,
    required this.getStartTabletlayout,
    required this.getStartedDesktopLayout,
  });
  final WidgetBuilder getstartmobileViewLayout;
  final WidgetBuilder getStartTabletlayout;
  final WidgetBuilder getStartedDesktopLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      // print(constrains.maxWidth);
      if (constrains.maxWidth < 600) {
        return getstartmobileViewLayout(context);
      } else if (constrains.maxWidth < 1200) {
        return getStartTabletlayout(context);
      } else {
        return getStartedDesktopLayout(context);
      }
    });
  }
}
