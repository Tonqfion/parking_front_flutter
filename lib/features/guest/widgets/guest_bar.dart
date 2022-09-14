import 'package:flutter/material.dart';
import 'package:parking/features/guest/screens/login_screen.dart';

import '../../../constants/global_variables.dart';
import '../screens/experiences_screen.dart';
import '../screens/hobbies_screen.dart';
import '../screens/intro_screen.dart';
import '../screens/skills_screen.dart';

class GuestBar extends StatefulWidget {
  static const routeName = '/guest-home';

  const GuestBar({
    Key? key,
  }) : super(key: key);

  @override
  State<GuestBar> createState() => _GuestBarState();
}

class _GuestBarState extends State<GuestBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const IntroScreen(),
    const ExperiencesScreen(),
    const SkillsScreen(),
    const HobbiesScreen(),
    const LoginScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Intro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work_history_outlined),
            label: 'XP',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard_alt_outlined),
            label: 'Skills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.motorcycle_outlined),
            label: 'Hobbies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings_outlined),
            label: 'Admin',
          ),
        ],
      ),
    );
  }
}
