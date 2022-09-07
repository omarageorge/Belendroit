import 'package:flutter/material.dart';
import 'package:belendroit/widgets/bottom_nav.dart';
import 'package:belendroit/screens/home_screen.dart';
import 'package:belendroit/screens/bookmark_screen.dart';
import 'package:belendroit/screens/notifications_screen.dart';
import 'package:belendroit/screens/account_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  static String id = 'navigation_screen';

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    const NotificationsScreen(),
    const BookmarkScreen(),
    const AccountScreen()
  ];

  void onTap(int? index) {
    setState(() {
      _currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: pages[_currentIndex]),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: onTap,
      ),
    );
  }
}
