import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:belendroit/screens/home_screen.dart';
import 'package:belendroit/screens/login_screen.dart';
import 'package:belendroit/screens/account_screen.dart';
import 'package:belendroit/screens/bookmark_screen.dart';
import 'package:belendroit/screens/navigation_screen.dart';
import 'package:belendroit/screens/registration_screen.dart';
import 'package:belendroit/screens/notifications_screen.dart';
import 'package:belendroit/providers/offer_provider.dart';
import 'package:belendroit/providers/location_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainScreen());
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OfferProvider>(
          create: (_) => OfferProvider(),
        ),
        ChangeNotifierProvider<LocationProvider>(
          create: (_) => LocationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Belendroid',
        theme: ThemeData.light().copyWith(
          inputDecorationTheme: InputDecorationTheme(
            prefixIconColor: Colors.black54,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.0,
              ),
            ),
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
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.0,
              ),
            ),
          ),
        ),
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          NotificationsScreen.id: (context) => NotificationsScreen(),
          BookmarkScreen.id: (context) => const BookmarkScreen(),
          AccountScreen.id: (context) => const AccountScreen(),
          NavigationScreen.id: (context) => const NavigationScreen(),
          RegistrationScreen.id: (context) => const RegistrationScreen(),
        },
      ),
    );
  }
}
