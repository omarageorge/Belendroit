import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:belendroit/constants.dart';
import 'package:belendroit/providers/location_provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static String id = 'account_screen';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String accountName = '';

  @override
  void initState() {
    super.initState();

    () async {
      await readUser().then((res) {
        setState(() {});
      });
    }();
  }

  Future<void> readUser() async {
    final String uid = _auth.currentUser!.uid;

    CollectionReference<Map<String, dynamic>> users =
        FirebaseFirestore.instance.collection("users");

    await users.doc(uid).get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      accountName = data['name'] as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kScreenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.grey.shade50,
                backgroundImage: const AssetImage('images/profile.png'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                accountName,
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.place,
                    color: Colors.blue,
                    size: 19.0,
                  ),
                  Text(
                    Provider.of<LocationProvider>(context).city,
                    style: TextStyle(
                        color: Colors.black87.withOpacity(0.5),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);
                },
                child: const Text('Sign out'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
