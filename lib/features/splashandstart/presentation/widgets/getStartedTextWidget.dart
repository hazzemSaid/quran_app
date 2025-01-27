import 'package:flutter/material.dart';

import '../../../../util/Appconstrains.dart';

class getStartedTextWidget extends StatelessWidget {
  final String title;
  final List<Color> colors;
  final Color textColor;
  const getStartedTextWidget(
      {super.key,
      required this.title,
      required this.colors,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        height: 50,
        width: 300,
        child: Center(
          child: Text(
            title,
            style: Appconstrains.tajawal_medium.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
