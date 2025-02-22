import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:quran_app/util/route.dart';

import '../../../../util/Appconstrains.dart';
import '../widgets/splash_image.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();
    _checkFirstLaunch();
  }

  void _checkFirstLaunch() async {
    var box = Hive.box('appBox');
    bool isOpenedBefore = box.get('isOpenedBefore', defaultValue: false);

    if (!isOpenedBefore) {
      // First launch, set the flag to true
      await box.put('isOpenedBefore', true);
    } else {
      context.go(MyRoute.getstart);
    }
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(Duration(seconds: 4), () {
      context.go(MyRoute.getstart);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        tween: AlignmentTween(
            begin: Alignment.bottomCenter, end: Alignment.center),
        duration: Duration(seconds: 3),
        curve: Curves.bounceIn,
        child: splashImage(),
        builder: (BuildContext context, Alignment value, Widget? child) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Appconstrains.primaryColor,
                  Appconstrains.secondaryColor,
                  Appconstrains.secondaryColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Align(
              alignment: value, // Animating the alignment of the image
              child: child,
            ),
          );
        },
      ),
    );
  }
}
