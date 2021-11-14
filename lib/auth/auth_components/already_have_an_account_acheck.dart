import 'package:flutter/material.dart';
import 'package:flutter_app/theme/my_colors.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: MyColor.kPrimaryColor),
        ),
        GestureDetector(
          onTap: press(),
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
              color: MyColor.kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
