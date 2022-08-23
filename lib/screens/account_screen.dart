import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static String id = 'account_screen';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 30.0, right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Column(
            children: [
              const CircleAvatar(
                radius: 60.0,
                backgroundImage:
                    NetworkImage('https://picsum.photos/250?image=9'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'John Doe',
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {},
                child: const Text('Sign out'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
