import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/core/util/Appconstrains.dart';
import 'package:quran_app/core/util/constants/assets.dart';

import '../../../home/presentation/screens/bottomNavigation.dart';

class AzkarFinalizationWidget extends StatefulWidget {
  const AzkarFinalizationWidget({super.key});

  @override
  State<AzkarFinalizationWidget> createState() =>
      _AzkarFinalizationWidgetState();
}

class _AzkarFinalizationWidgetState extends State<AzkarFinalizationWidget>
    with SingleTickerProviderStateMixin {
  late Animation? animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        if (animation?.value == 1) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => bottomNavigation(),
            ),
          );
        }
      });
    controller.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appconstrains.primaryColor,
      body: Center(
          child: Lottie.asset(
        MyAssets.end_azkar_animation_file,
        controller: controller,
        frameRate: FrameRate(60),
        repeat: false,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
      )),
    );
  }
}
