import 'package:flutter/material.dart';

import '../../../../core/util/Appconstrains.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
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
      width: 250,
      child: Center(
        child: Text(
          title,
          style: Appconstrains.tajawal_medium.copyWith(color: textColor),
        ),
      ),
    );
  }
}
