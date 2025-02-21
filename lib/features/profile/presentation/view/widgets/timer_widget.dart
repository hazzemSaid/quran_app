import 'package:flutter/material.dart';

import '../../../../../util/Appconstrains.dart' show Appconstrains;

class timer_widget extends StatelessWidget {
  final String title;
  final String time;
  final void Function(TimeOfDay) onTimeChanged;
  const timer_widget({
    super.key,
    required this.title,
    required this.time,
    required this.onTimeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //i need to chose hour and minute
          GestureDetector(
            onTap: () {
              showTimePicker(context: context, initialTime: TimeOfDay.now())
                  .then((val) => onTimeChanged(val!));
            },
            child: SizedBox(
              child: Text(
                time,
                style: Appconstrains.tajawal_bold.copyWith(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                title,
                style: Appconstrains.tajawal_bold.copyWith(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              Icon(
                Icons.timelapse_rounded,
                color: Appconstrains.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
