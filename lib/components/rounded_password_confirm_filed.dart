import 'package:flutter/material.dart';
import 'package:movie/components/text_filed_container.dart';
import 'package:movie/constants.dart';

class RoundedPasswordConfirmFiled extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordConfirmFiled({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: "Konfirmasi Password",
          icon: Icon(
            Icons.lock,
            color: kSecondaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kSecondaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
