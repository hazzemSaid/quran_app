import 'package:flutter/material.dart';

import '../../../../../util/Appconstrains.dart';
import '../../widgets/splash_image.dart';

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: double.infinity, height: 90),
                splashImage(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: _emailKey,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال البريد الإلكتروني';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'يرجى إدخال بريد إلكتروني صالح';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: Appconstrains.cairo_bold.copyWith(
                        fontSize: 18,
                        color: Colors.black38,
                      ),
                      hintText: 'البريد الالكتروني',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ValueListenableBuilder(
                    valueListenable: eyeicon,
                    builder: (context, value, child) {
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
                            fontSize: 18,
                            color: Colors.black38,
                          ),
                          hintText: ' كلمة السر',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              eyeicon.value = !value; // Toggle visibility
                            },
                            icon: Icon(
                              value
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 20.0, top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'نسيت كلمة السر ؟',
                      style: Appconstrains.tajawal_medium.copyWith(
                        color: Appconstrains.primaryColor,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
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
                      child: Text('تسجيل دخول',
                          textAlign: TextAlign.center,
                          style: Appconstrains.tajawal_medium.copyWith(
                            color: const Color.fromARGB(255, 235, 235, 235),
                          )),
                    ),
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print('Validated');
                    }
                  },
                ),
                SizedBox(
                  height: 28,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                        child: Text(
                          'انشاء حساب',
                          style: Appconstrains.tajawal_medium.copyWith(
                            color: Appconstrains.primaryColor,
                          ),
                        ),
                      ),
                      Text("ليس لديك حساب ؟",
                          style: Appconstrains.cairo_light.copyWith(
                            color: Colors.black38,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
