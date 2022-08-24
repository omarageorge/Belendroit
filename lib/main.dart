import 'package:belendroit/screens/registration_screen.dart';
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
      theme: ThemeData.light().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: Colors.black54,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.5),
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        NotificationsScreen.id: (context) => const NotificationsScreen(),
        BookmarkScreen.id: (context) => const BookmarkScreen(),
        AccountScreen.id: (context) => const AccountScreen(),
        NavigationScreen.id: (context) => const NavigationScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
      },
    );
  }
}
