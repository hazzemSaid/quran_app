import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../util/Appconstrains.dart';
import '../widgets/alzakr.dart';
import '../widgets/homescreen.dart';
import '../widgets/listenquran.dart';
import '../widgets/praying.dart';
import '../widgets/profile.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({super.key});

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int selectedIndex = 0;
  final List<Widget> _screens = [
    mainHomeScreen(),
    alzkarWidget(),
    quranAudioListener(),
    prayerScreen(),
    userProfile()
  ];
  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Appconstrains.primaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 11,
      unselectedItemColor: Appconstrains.secondaryColor,
      selectedItemColor: Colors.grey,
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.bookOpen,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.handsPraying,
          ),
          label: 'azkar',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.kaaba,
          ),
          label: 'quran',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.mosque,
          ),
          label: ' praying',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
