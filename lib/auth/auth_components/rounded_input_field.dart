import 'package:flutter/material.dart';
import 'package:flutter_app/auth/auth_components/text_field_container.dart';
import 'package:flutter_app/theme/my_colors.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: MyColor.kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: MyColor.kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
