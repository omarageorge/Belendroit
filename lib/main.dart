import 'package:flutter/material.dart';
import 'package:belendroit/screens/home_screen.dart';
import 'package:belendroit/screens/bookmark_screen.dart';
import 'package:belendroit/screens/notifications_screen.dart';
import 'package:belendroit/screens/account_screen.dart';
import 'package:belendroit/screens/login_screen.dart';
import 'package:belendroit/screens/navigation_screen.dart';

void main() => runApp(const MainScreen());

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belendroid',
      theme: ThemeData(
        inputDecorationTheme:
            const InputDecorationTheme(prefixIconColor: Colors.black54),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        NotificationsScreen.id: (context) => const NotificationsScreen(),
        BookmarkScreen.id: (context) => const BookmarkScreen(),
        AccountScreen.id: (context) => const AccountScreen(),
        NavigationScreen.id: (context) => const NavigationScreen()
      },
    );
  }
}
