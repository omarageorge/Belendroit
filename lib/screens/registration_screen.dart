import 'package:belendroit/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:belendroit/constants.dart';
import 'package:belendroit/widgets/route.dart';
import 'package:belendroit/screens/login_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool showSpinner = false;

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      blur: 1.0,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration().copyWith(
                          prefixIcon: const Icon(
                            Icons.person,
                          ),
                          hintText: 'Name',
                        ),
                        validator: (String? value) {
                          if (value == null ||
                              value.isEmpty ||
                              (value.length < 3)) {
                            return 'Username should contain at least 3 characters.';
                          }
                          return null;
                        },
                      ),
                      kSpaceY,
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
                      kSpaceY,
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
                      kSpaceY,
                      TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              showSpinner = true;
                            });

                            await _auth
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((value) {
                              createUser();
                            }).catchError((e) {
                              setState(() {
                                showSpinner = false;
                              });
                            });
                          }
                        },
                        style: kTextButtonStyle,
                        child: const Text('Register'),
                      ),
                    ],
                  ),
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
      ),
    );
  }

  Future<void> createUser() async {
    final String uid = _auth.currentUser!.uid;

    final DocumentReference<Map<String, dynamic>> userDocument =
        FirebaseFirestore.instance.collection('users').doc(uid);

    final UserModel newUser = UserModel(
      uid: uid,
      name: _nameController.text,
      email: _emailController.text,
    );

    await userDocument.set(newUser.toJson()).then((value) {
      Navigator.pop(context);
    });
  }
}
