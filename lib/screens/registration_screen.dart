import 'package:flutter/material.dart';
import 'package:belendroit/constants.dart';
import 'package:belendroit/screens/login_screen.dart';
import 'package:belendroit/components/route.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static String id = 'registration_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 30.0,
            right: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create an account',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              kSpaceY,
              TextField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration().copyWith(
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    hintText: 'Name'),
              ),
              kSpaceY,
              TextField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration().copyWith(
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                    hintText: 'Email'),
              ),
              kSpaceY,
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
              kSpaceY,
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: kTextButtonStyle,
                child: const Text('Register'),
              ),
              kSpaceY,
              Link(
                text: "Already have an account?",
                action: 'Sign in',
                route: LoginScreen.id,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
