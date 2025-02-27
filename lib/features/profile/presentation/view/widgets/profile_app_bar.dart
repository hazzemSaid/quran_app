import 'package:flutter/material.dart';

import '../../../../../core/util/Appconstrains.dart' show Appconstrains;

class profile_app_bar extends StatelessWidget {
  const profile_app_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.09,
      color: Appconstrains.primaryColor,
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'المزيد',
          style: Appconstrains.tajawal_bold.copyWith(
            color: Appconstrains.secondaryColor,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
