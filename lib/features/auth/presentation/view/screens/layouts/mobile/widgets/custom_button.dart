import 'package:flutter/material.dart';

import '../../../../../../../../core/util/Appconstrains.dart';

class custom_button extends StatelessWidget {
  const custom_button({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.08,
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
          colors: [
            Appconstrains.primaryColor,
            Appconstrains.primaryColor,
            const Color.fromARGB(255, 14, 223, 195),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 22.0),
        child: Text(text,
            textAlign: TextAlign.center,
            style: Appconstrains.tajawal_medium.copyWith(
              color: const Color.fromARGB(255, 235, 235, 235),
            )),
      ),
    );
  }
}
