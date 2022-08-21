import 'package:flutter/material.dart';
import 'package:belendroit/components/bottom_nav.dart';
import 'package:belendroit/screens/home_screen.dart';
import 'package:belendroit/screens/liked_screen.dart';
import 'package:belendroit/screens/notifications_screen.dart';

void main() => runApp(const MainScreen());

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const NotificationsScreen(),
    const LikedScreen(),
  ];

  void onTap(int? index) {
    setState(() {
      _currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belendroid',
      theme: ThemeData(
        inputDecorationTheme:
            const InputDecorationTheme(prefixIconColor: Colors.black54),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: pages[_currentIndex]),
        bottomNavigationBar:
            BottomNavBar(currentIndex: _currentIndex, onTap: onTap),
      ),
      routes: {
        HomeScreen.pageId: (context) => const HomeScreen(),
        NotificationsScreen.pageId: (context) => const NotificationsScreen(),
        LikedScreen.pageId: (context) => const LikedScreen(),
      },
    );
  }
}
