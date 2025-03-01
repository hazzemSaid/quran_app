import 'package:flutter/material.dart';

import '../../../../../core/util/Appconstrains.dart' show Appconstrains;

class books_tap extends StatelessWidget {
  const books_tap({
    super.key,
    required this.title,
    required this.notificatoinactive,
    required this.onChanged,
  });
  final void Function(bool)? onChanged;
  final bool notificatoinactive;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Switch.adaptive(
                  activeColor: Appconstrains.primaryColor,
                  value: notificatoinactive,
                  onChanged: onChanged)),
          Expanded(
            flex: 9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
                  Icons.book,
                  color: Appconstrains.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
