import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

import '../../../../../../../../core/util/Appconstrains.dart';
import '../widgets/custom_button.dart';
import '../widgets/email_text_field.dart';
import '../widgets/value_listenableBuilder_for_password.dart';

class MobileRegistration extends StatelessWidget {
  MobileRegistration({super.key});
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailKey = TextEditingController();
  final TextEditingController _passwordKey = TextEditingController();
  final TextEditingController _validpasswordKey = TextEditingController();
  final ValueNotifier<bool> eyeicon = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 231, 244, 239),
              Appconstrains.secondaryColor,
              Appconstrains.secondaryColor,
              Appconstrains.secondaryColor,
            ],
            end: Alignment.bottomCenter,
          ),
        ),
        child: KeyboardAvoider(
          autoScroll: true,
          child: Form(
            key: _formkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.2,
                    width: double.infinity,
                  ),
                  Text(
                    "انشاء حساب",
                    style: Appconstrains.tajawal_bold.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: Appconstrains.cairo_bold.copyWith(
                            fontSize: 15,
                            color: Colors.black38,
                          ),
                          hintText: 'الاسم',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: email_text_field(emailKey: _emailKey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: value_listenableBuilder_for_password(
                        Text: 'كلمة السر',
                        eyeicon: eyeicon,
                        passwordKey: _passwordKey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: value_listenableBuilder_for_password(
                        Text: 'اعادة كلمة السر',
                        eyeicon: eyeicon,
                        passwordKey: _validpasswordKey),
                  ),
                  SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: custom_button(
                      text: ' انشاء حساب',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "انشاء حساب بواسطة",
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
                      SizedBox(width: double.infinity, height: 33),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
