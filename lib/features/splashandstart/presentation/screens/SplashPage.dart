import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
