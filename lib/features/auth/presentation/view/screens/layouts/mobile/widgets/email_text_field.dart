import 'package:flutter/material.dart';

import '../../../../../../../../core/util/Appconstrains.dart';

class email_text_field extends StatelessWidget {
  const email_text_field({
    super.key,
    required TextEditingController emailKey,
  }) : _emailKey = emailKey;

  final TextEditingController _emailKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailKey,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال البريد الإلكتروني';
        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'يرجى إدخال بريد إلكتروني صالح';
        }
        return null;
      },
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        hintStyle: Appconstrains.cairo_bold.copyWith(
          fontSize: 15,
          color: Colors.black38,
        ),
        hintText: 'البريد الالكتروني',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
