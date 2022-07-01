import 'package:flutter/material.dart';

import '../utils/constant.dart';
import 'home_screen.dart';

class WellcomeScreen extends StatefulWidget {
  static String routeName = '/';
  const WellcomeScreen({Key? key}) : super(key: key);

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/coverindo.png'),
            Text(
              'About Indonesia',
              style: TextStyle(
                color: kFColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Create By Kawago',
              style: TextStyle(
                color: kTColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
