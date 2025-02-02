import 'package:flutter/material.dart';
import 'package:quran_app/features/auth/presentation/view/screens/layouts/mobile/widgets/password_text_field.dart';

class value_listenableBuilder_for_password extends StatelessWidget {
  const value_listenableBuilder_for_password({
    super.key,
    required this.Text,
    required this.eyeicon,
    required TextEditingController passwordKey,
  }) : _passwordKey = passwordKey;

  final ValueNotifier<bool> eyeicon;
  final TextEditingController _passwordKey;
  final String Text;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: eyeicon,
      builder: (context, value, child) {
        return password_text_field(
            Text: Text, passwordKey: _passwordKey, eyeicon: eyeicon);
      },
    );
  }
}
