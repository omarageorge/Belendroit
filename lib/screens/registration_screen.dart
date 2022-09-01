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
  late String name;
  late String email;
  late String password;
  bool admin = false;
  bool signupError = false;
  bool showSpinner = false;

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
                Visibility(
                  visible: signupError,
                  child: const SizedBox(
                    height: 10.0,
                  ),
                ),
                Visibility(
                  visible: signupError,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sorry, could not register.',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.red[600],
                        ),
                      ),
                    ],
                  ),
                ),
                kSpaceY,
                TextField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration().copyWith(
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                    hintText: 'Name',
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                kSpaceY,
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
                  onChanged: (value) {
                    password = value;
                  },
                ),
                kSpaceY,
                TextButton(
                  onPressed: () async {
                    if (name.isEmpty || email.isEmpty || password.isEmpty) {
                      setState(() {
                        signupError = true;
                      });
                    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(email)) {
                      setState(() {
                        signupError = true;
                      });
                    } else {
                      setState(() {
                        showSpinner = true;
                      });

                      await _auth
                          .createUserWithEmailAndPassword(
                              email: email, password: password)
                          .then((value) {
                        createUser();
                      }).catchError((e) {
                        setState(() {
                          showSpinner = false;
                          signupError = true;
                        });
                      });
                    }
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
      ),
    );
  }

  Future<void> createUser() async {
    final String uid = _auth.currentUser!.uid;

    final DocumentReference<Map<String, dynamic>> userDocument =
        FirebaseFirestore.instance.collection('users').doc(uid);

    final UserModel newUser = UserModel(
      uid: uid,
      name: name,
      email: email,
      admin: admin,
    );

    await userDocument.set(newUser.toJson()).then((value) {
      setState(() {
        signupError = false;
      });

      Navigator.pop(context);
    });
  }
}
