import 'package:flutter/material.dart';
import 'package:flutter_app/auth/auth_components/text_field_container.dart';
import 'package:flutter_app/theme/my_colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: MyColor.kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: MyColor.kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: MyColor.kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
