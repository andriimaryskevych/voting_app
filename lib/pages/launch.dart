import 'package:flutter/material.dart';
import 'package:voting_app/contants.dart';
import 'package:voting_app/widgets/shared.dart';

class LaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: <Widget>[
          Text(
            kAppName,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent
            ),
          ),
          SizedBox(height: 200),
          LoginButton(
            label: 'Google Sign In',
            onPressed: () => signIn(context),
          ),
          SizedBox(height: 10),
          LoginButton(
            label: 'Anonymus Sign In',
            onPressed: () => signIn(context),
          ),
        ],
      ),
    );
  }

  void signIn(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }
}

