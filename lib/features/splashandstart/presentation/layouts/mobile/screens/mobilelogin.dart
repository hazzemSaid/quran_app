import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

import '../../../../../../util/Appconstrains.dart';
import '../../../widgets/splash_image.dart';

class MobileLoginView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailKey = TextEditingController();
  final TextEditingController _passwordKey = TextEditingController();
  final ValueNotifier<bool> eyeicon = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 231, 244, 239),
                Appconstrains.secondaryColor,
              ],
              end: Alignment.bottomCenter,
            ),
          ),
          child: KeyboardAvoider(
            autoScroll: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: double.infinity, height: 90),
                splashImage(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: email_text_field(emailKey: _emailKey),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: value_listenableBuilder_for_password(
                      Text: 'كلمة السر',
                      eyeicon: eyeicon,
                      passwordKey: _passwordKey),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20.0, top: 10, bottom: 28),
                  child: forget_password_align(),
                ),
                GestureDetector(
                  child: custom_button(
                    text: 'تسجيل دخول',
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print('Validated');
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row_of_register()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

class custom_button extends StatelessWidget {
  const custom_button({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Appconstrains.primaryColor,
            Appconstrains.primaryColor,
            const Color.fromARGB(255, 14, 223, 195),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 22.0),
        child: Text(text,
            textAlign: TextAlign.center,
            style: Appconstrains.tajawal_medium.copyWith(
              color: const Color.fromARGB(255, 235, 235, 235),
            )),
      ),
    );
  }
}

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
