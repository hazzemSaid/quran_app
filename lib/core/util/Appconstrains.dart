import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appconstrains {
  static const Color primaryColor = Color(0xff00A08A);
  static const Color secondaryColor = Color(0xffFFFFFF);
  static TextStyle tajawal_bold = GoogleFonts.tajawal(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle tajawal_regular = GoogleFonts.tajawal(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle tajawal_light = GoogleFonts.tajawal(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );

  static TextStyle tajawal_medium = GoogleFonts.tajawal(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle cairo_bold = GoogleFonts.cairo(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle cairo_regular = GoogleFonts.cairo(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextStyle cairo_light = GoogleFonts.cairo(
    fontSize: 20,
    fontWeight: FontWeight.w300,
    color: Colors.black,
  );

  Map<String, int> prayerIDs = {
    "الفجر": 1,
    "الشروق": 2,
    "الظهر": 3,
    "العصر": 4,
    "المغرب": 5,
    "العشاء": 6,
    "أذكار الصباح": 7,
    "أذكار المساء": 8,
    "سورة الكهف": 9,
    "سورة البقرة": 10,
    "سورة الملك": 11,
    "الصلاة علي النبي": 12,
  };
}
