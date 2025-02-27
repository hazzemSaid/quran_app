import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../../core/util/Appconstrains.dart';

class Row_of_register extends StatelessWidget {
  const Row_of_register({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.go('/register');
          },
          child: Text(
            'انشاء حساب',
            style: Appconstrains.tajawal_medium.copyWith(
              color: Appconstrains.primaryColor,
              fontSize: 16,
            ),
          ),
        ),
        Text("ليس لديك حساب ؟",
            style: Appconstrains.tajawal_medium.copyWith(
              color: Colors.black38,
              fontSize: 16,
            )),
      ],
    );
  }
}
