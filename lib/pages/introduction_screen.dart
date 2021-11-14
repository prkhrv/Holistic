import 'package:flutter/material.dart';
import 'package:flutter_app/auth/login.dart';
// import 'package:flutter_fitness_app/HomeScreen.dart';
import 'package:flutter_app/theme/my_colors.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/intro.png'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width * 0.75,
                  child: const Text(
                    "30 Days Fitness Challenges",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Track your fitness level by our smart Mobile App. Calories sleep and training.",
                  style: TextStyle(color: Colors.black54, height: 1.5),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Spacer(),
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      elevation: 2.0,
                      fillColor: MyColor.kPrimaryColor,
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15),
                      shape: CircleBorder(),
                    )
                  ],
                ),
                SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}
