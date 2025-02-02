import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:quran_app/features/auth/presentation/view/screens/layouts/mobile/widgets/Row_of_register.dart';
import 'package:quran_app/util/route.dart';

import '../../../../../../../../util/Appconstrains.dart';
import '../../../../../../../splashandstart/presentation/widgets/splash_image.dart';
import '../widgets/custom_button.dart';
import '../widgets/email_text_field.dart';
import '../widgets/forget_password_align.dart';
import '../widgets/value_listenableBuilder_for_password.dart';

class MobileLoginView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailKey = TextEditingController();
  final TextEditingController _passwordKey = TextEditingController();
  final ValueNotifier<bool> eyeicon = ValueNotifier<bool>(false);

  MobileLoginView({super.key});

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
                SizedBox(width: double.infinity, height: 40),
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
                      //do vlidation and using bloc to login
                      context.go(MyRoute.home);
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "تسجيل دخول بواسطة",
                      style: Appconstrains.tajawal_medium.copyWith(
                        color: Colors.black,
                      ),
                    )),
                SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                      size: 30,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                  width: double.infinity,
                ),
                Row_of_register(),
                SizedBox(width: double.infinity, height: 33),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
