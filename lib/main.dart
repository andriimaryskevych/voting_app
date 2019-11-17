import 'package:flutter/material.dart';
import 'package:voting_app/contants.dart';
import 'package:voting_app/pages/home.dart';
import 'package:voting_app/pages/launch.dart';
import 'package:voting_app/pages/result.dart';
import 'package:provider/provider.dart';
import 'package:voting_app/state/vote.dart';

void main() => runApp(VoteApp());

class VoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => VoteState(),
        )
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Scaffold(
                body: LaunchPage(),
              ),
          '/home': (context) => Scaffold(
                appBar: AppBar(
                  title: Text(kAppName),
                  centerTitle: true,
                ),
                body: HomePage(),
              ),
          '/result': (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Result'),
                  leading: IconButton(
                    icon: Icon(Icons.home),
                    color: Colors.white,
                    onPressed: () {
                      print('Result Screen');
                    },
                  ),
                ),
                body: ResultPage(),
              ),
        },
      ),
    );
  }
}
