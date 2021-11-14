// ignore_for_file: prefer_const_constructors, dead_code, unused_element, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home/screens/fifth.dart';
import 'package:flutter_app/home/screens/fourth.dart';
import 'package:flutter_app/home/screens/pedometer_1.dart';
import 'package:flutter_app/home/screens/second.dart';
import 'package:flutter_app/home/screens/third.dart';
import 'package:flutter_app/theme/my_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  double height = 0.0;
  double weight = 0.0;
  double bmi = 0.0;

  final Exercise _sites = new Exercise();
  final Stepcount _dashboard = new Stepcount();
  final Second _clients = new Second();
  final Fourth _flutterpages = new Fourth();
  final Fifth _pageother = new Fifth();

  Widget _showPage = new Stepcount();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _dashboard;
        break;
      case 1:
        return _clients;
        break;
      case 2:
        return _sites;
        break;
      case 3:
        return _flutterpages;
        break;
      case 4:
        return _pageother;
        break;
      default:
        return Center(
          child: Center(
            child: Text(
              '404 Page Not Found',
              style: TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      height = prefs.getDouble('height')!;
      weight = prefs.getDouble('weight')!;
      bmi = (703 * weight) / (height * height);
    });
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: pageIndex,
        height: 50.0,
        items: <Widget>[
          Icon(FontAwesomeIcons.shoePrints, size: 23, color: Colors.white),
          Icon(FontAwesomeIcons.utensils, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.dumbbell, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.fileMedicalAlt, size: 30, color: Colors.white),
          Icon(FontAwesomeIcons.commentMedical, size: 30, color: Colors.white),
        ],
        color: MyColor.kPrimaryColor,
        buttonBackgroundColor: MyColor.kPrimaryColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}
