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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String errorMessage = '';

  bool showErrorMessage = false;
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
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
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
                const SizedBox(
                  height: 20.0,
                ),
                Visibility(
                  visible: showErrorMessage,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          errorMessage,
                          style: TextStyle(color: Colors.red[600]),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration().copyWith(
                          prefixIcon: const Icon(
                            Icons.email,
                          ),
                          hintText: 'Email',
                        ),
                        validator: (String? value) {
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value!)) {
                            return 'Please enter a valid email address.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration().copyWith(
                          prefixIcon: const Icon(
                            Icons.password,
                          ),
                          hintText: 'Password',
                        ),
                        validator: (String? value) {
                          if (value!.length < 6) {
                            return 'Password should contain at least 6 characters.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              showSpinner = true;
                            });

                            await _auth
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((uid) {
                              setState(() {
                                showSpinner = false;
                              });

                              Navigator.pushNamed(context, NavigationScreen.id);
                            }).catchError((e) {
                              setState(() {
                                showSpinner = false;
                                errorMessage = e.code;
                                showErrorMessage = true;
                              });
                            });
                          }
                        },
                        style: kTextButtonStyle,
                        child: const Text('Sign in'),
                      ),
                    ],
                  ),
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
