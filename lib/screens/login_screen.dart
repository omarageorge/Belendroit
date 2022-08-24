import 'package:flutter/material.dart';
import 'package:belendroit/constants.dart';
import 'package:belendroit/components/route.dart';
import 'package:belendroit/screens/navigation_screen.dart';
import 'package:belendroit/screens/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String id = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration().copyWith(
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    hintText: 'Email'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration().copyWith(
                  prefixIcon: const Icon(
                    Icons.password,
                  ),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, NavigationScreen.id);
                },
                style: kTextButtonStyle,
                child: const Text('Sign in'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Link(
                text: "Don't have an account?",
                action: 'Register',
                route: RegistrationScreen.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
