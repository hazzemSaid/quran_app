import 'package:flutter/material.dart';
import 'package:quran_app/features/profile/presentation/view/widgets/books_tap.dart';

class profile_snn_quran extends StatelessWidget {
  const profile_snn_quran({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: double.infinity,
          height: 10,
        ),
        books_tap(
          title: 'سورة الكهف',
        ),
        books_tap(
          title: 'سورة البقرة',
        ),
        books_tap(
          title: 'سورة الملك',
        )
      ],
    );
  }
}
