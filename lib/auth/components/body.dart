import 'package:flutter/material.dart';
import 'package:flutter_app/auth/components/background.dart';
import 'package:flutter_app/auth/signup.dart';
import 'package:flutter_app/auth/auth_components/already_have_an_account_acheck.dart';
import 'package:flutter_app/auth/auth_components/rounded_button.dart';
import 'package:flutter_app/auth/auth_components/rounded_input_field.dart';
import 'package:flutter_app/auth/auth_components/rounded_password_field.dart';
import 'package:flutter_app/theme/my_colors.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Phone",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            const Text(
              "Don’t have an Account ? ",
              style: TextStyle(color: MyColor.kPrimaryColor),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
              child: const Text("Sign up",
                  style: TextStyle(
                      color: MyColor.kPrimaryColor,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
