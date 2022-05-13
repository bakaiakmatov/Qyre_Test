import 'package:flutter/material.dart';
import 'package:qyre_test/constans/app_colors.dart';
import 'package:qyre_test/ui/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final widgetOptions = const [
    HomeScreen(),
    Text('2'),
    Text('3'),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: AppColors.codGrayColor,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.whiteColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: RotationTransition(
                turns: AlwaysStoppedAnimation(40 / 360),
                child: Icon(Icons.notifications_none_outlined),
              ),
              label: 'Notifications',
            ),
          ],
        ),
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
      ),
    );
  }
}
