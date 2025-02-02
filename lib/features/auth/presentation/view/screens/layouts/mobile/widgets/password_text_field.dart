import 'package:flutter/material.dart';

import '../../../../../../../../util/Appconstrains.dart';

class password_text_field extends StatelessWidget {
  const password_text_field({
    super.key,
    required TextEditingController passwordKey,
    required this.eyeicon,
    required this.Text,
  }) : _passwordKey = passwordKey;

  final TextEditingController _passwordKey;
  final ValueNotifier<bool> eyeicon;
  final String Text;
  bool get value => eyeicon.value;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordKey,
      obscureText: value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال كلمة السر';
        } else if (value.length < 6) {
          return 'كلمة السر يجب أن تكون 6 أحرف على الأقل';
        }
        return null;
      },
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        hintStyle: Appconstrains.cairo_bold.copyWith(
          fontSize: 15,
          color: Colors.black38,
        ),
        hintText: Text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        prefixIcon: IconButton(
          onPressed: () {
            eyeicon.value = !value; // Toggle visibility
          },
          icon: Icon(
            value ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
          ),
        ),
      ),
    );
  }
}
