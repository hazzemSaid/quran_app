import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran_app/features/profile/presentation/viewmodel/data_storage_hive/data_storage_hive_cubit.dart';

import '../../../../util/Appconstrains.dart';
import '../../../azkar/presentation/screen/alzakr.dart';
import '../../../pary/presentation/view/screens/praying.dart';
import '../../../profile/presentation/view/screens/profile.dart';
import '../widgets/homescreen.dart';
import '../widgets/quranReader.dart';

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
    quranReader(),
    prayerScreen(),
    BlocProvider<DataStorageHiveCubit>(
      create: (context) => DataStorageHiveCubit(),
      child: userProfile(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
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
          label: 'ورد اليوم',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.handsPraying,
          ),
          label: 'الاذكار',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.kaaba,
          ),
          label: 'الاستماع',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.mosque,
          ),
          label: ' الصلاة',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'المزيد',
        ),
      ],
    );
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
