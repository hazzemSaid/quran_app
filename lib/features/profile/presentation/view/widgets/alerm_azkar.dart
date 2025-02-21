import 'package:flutter/material.dart';

import '../../../../../util/Appconstrains.dart' show Appconstrains;

class alerm_azkar extends StatelessWidget {
  const alerm_azkar({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.icon,
  });
  final bool value;
  final String title;
  final void Function(bool) onChanged;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Switch.adaptive(
            value: value,
            activeColor: Appconstrains.primaryColor,
            inactiveTrackColor: Colors.grey,
            onChanged: onChanged,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: Appconstrains.tajawal_bold.copyWith(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                icon,
                color: Appconstrains.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
