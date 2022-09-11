import 'package:flutter/material.dart';
import 'package:parking/features/home/screens/home_screen.dart';

import '../../constants/global_variables.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/actual-home';

  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const Center(
      child: Text('Profile page'),
    ),
    const Center(
      child: Text('Contribution page'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.pin_drop_outlined),
            label: 'Carte',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outlined),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.motorcycle_outlined),
            label: 'Contributions',
          ),
        ],
      ),
    );
  }
}
