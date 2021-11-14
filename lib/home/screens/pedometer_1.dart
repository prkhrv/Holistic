import 'package:flutter/material.dart';
import 'package:flutter_app/theme/my_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Stepcount extends StatefulWidget {
  const Stepcount({Key? key}) : super(key: key);

  @override
  _StepcountState createState() => _StepcountState();
}

class _StepcountState extends State<Stepcount> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';
  String _stepsPercent = '';
  String _distance = '0.0';
  String _calories = '0.0';
  double _stepsPer = 0.0;
  String formatDate(DateTime d) {
    return d.toString().substring(0, 19);
  }

  // void checkPermission() async {
  //   var status = await Permission.activityRecognition.status;
  //   if (status.isDenied) {
  //     var activity_permission = await Permission.activityRecognition.request();
  //     // We didn't ask for permission yet or the permission has been denied before but not permanently.
  //   }
  //   if (await Permission.location.isRestricted) {
  //     // The OS restricts access, for example because of parental controls.
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // checkPermission();
    initPlatformState();
  }

  void calculateMiles(steps) {
    steps = double.parse(steps);
    double dist = steps / 2500;
    setState(() {
      _distance = dist.toStringAsFixed(2);
    });
  }

  void calculateCalories(steps) {
    steps = double.parse(steps);
    double caloriesCount = 0.04 * steps;
    setState(() {
      _calories = caloriesCount.toStringAsFixed(2);
    });
  }

  void onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps.toString();
      _stepsPer = int.parse(_steps) / 10000;
      if (_stepsPer > 1) {
        _stepsPer = 1;
      }
      _stepsPercent = (_stepsPer * 100).toString();
      calculateMiles(_steps);
      calculateCalories(_steps);
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularPercentIndicator(
                radius: 180.0,
                lineWidth: 15.0,
                percent: _stepsPer,
                animation: true,
                center:
                    Text("$_stepsPercent %", style: TextStyle(fontSize: 30)),
                progressColor: MyColor.secondary,
              ),
              Text(
                'Steps taken:',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _steps,
                style: TextStyle(fontSize: 60),
              ),
              Divider(
                height: 60,
                thickness: 0,
                color: Colors.white,
              ),
              Container(
                height: 80,
                transform: Matrix4.translationValues(0.0, -60, 0.0),
                child: Image.asset('assets/marathon.png'),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepOrange),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Heart",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            "80",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Per min",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColor.secondary),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MyColor.primary),
                              child: Icon(
                                Icons.local_fire_department_sharp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Calories",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              "$_calories",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Kcal",
                              style: TextStyle(fontSize: 12.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orangeAccent),
                            child: Icon(
                              Icons.nightlight_round,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sleep",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            "8:30",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Hours",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurple),
                            child: Icon(
                              FontAwesomeIcons.running,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Distance",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            "$_distance",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Miles",
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
