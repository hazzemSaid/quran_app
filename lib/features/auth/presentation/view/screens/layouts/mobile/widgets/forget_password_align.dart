import 'package:flutter/material.dart';

import '../../../../../../../../util/Appconstrains.dart';

class forget_password_align extends StatelessWidget {
  const forget_password_align({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        'نسيت كلمة السر ؟',
        style: Appconstrains.tajawal_medium.copyWith(
          color: Appconstrains.primaryColor,
        ),
      ),
    );
  }
}
