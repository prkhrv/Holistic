// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/home/bmi_screen.dart';
import 'package:flutter_app/home/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final bool _isDataExist = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      SharedPreferences.getInstance().then((prefs) async {
        if (prefs.getDouble('height') == null ||
            prefs.getDouble('weight') == null) {
          print("User is Logged in : $_isDataExist");
          Timer(
              const Duration(seconds: 1),
              () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BmiScreen()),
                  ));
        } else {
          Timer(
              const Duration(seconds: 1),
              () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashBoard()),
                  ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
