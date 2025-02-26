import 'package:flutter/material.dart';
import 'package:quran_app/util/Appconstrains.dart';

class time_remaind extends StatelessWidget {
  const time_remaind({
    super.key,
    required this.time_s,
    required this.time_f,
  });
  final String time_f;
  final String time_s;

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                time_f,
                style: Appconstrains.tajawal_medium.copyWith(
                  color: Appconstrains.secondaryColor,
                  fontSize: 20.0,
                ),
              ),
              Text(
                time_s,
                style: Appconstrains.tajawal_medium.copyWith(
                  color: Appconstrains.secondaryColor,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
