import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:belendroit/constants.dart';
import 'package:belendroit/widgets/route.dart';
import 'package:belendroit/screens/navigation_screen.dart';
import 'package:belendroit/screens/registration_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:belendroit/helper/location_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String id = '/';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  bool loginError = false;
  bool showSpinner = false;

  @override
  void initState() {
    super.initState();

    setLocality().then((value) {
      setState(() {});

      if (_auth.currentUser != null) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushNamed(NavigationScreen.id);
        });
      }
    });
  }

  Future<void> setLocality() async {
    await LocationManager.requestPermission().then((response) {
      LocationManager.determineLocality(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      blur: 1.0,
      inAsyncCall: showSpinner,
      child: Scaffold(
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
                Visibility(
                  visible: loginError,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Invalid email or password.',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.red[600],
                        ),
                      ),
                    ],
                  ),
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
                    hintText: 'Email',
                  ),
                  onChanged: (value) {
                    email = value;
                  },
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
                  onChanged: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () async {
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(email) ||
                        email.isEmpty) {
                      setState(() {
                        loginError = true;
                      });
                    } else if (password.isEmpty) {
                      setState(() {
                        loginError = true;
                      });
                    } else {
                      setState(() {
                        showSpinner = true;
                      });

                      await _auth
                          .signInWithEmailAndPassword(
                              email: email, password: password)
                          .then((uid) {
                        Navigator.pushNamed(context, NavigationScreen.id);

                        setState(() {
                          showSpinner = false;
                          loginError = false;
                        });
                      }).catchError((e) {
                        setState(() {
                          showSpinner = false;
                          loginError = true;
                        });
                      });
                    }
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
      ),
    );
  }
}
