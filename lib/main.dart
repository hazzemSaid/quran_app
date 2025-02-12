import 'package:flutter/material.dart';
import 'package:quran_library/quran_library.dart';

import 'util/route.dart';

void main() {
  QuranLibrary().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //change direction
      locale: const Locale('ar', 'SA'),
      title: 'Quran App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      routerConfig: MyRoute.router,
    );
  }
}
