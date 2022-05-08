// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:movie/components/text_filed_container.dart';
import 'package:movie/constants.dart';

class RoundedPasswordFiled extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordFiled({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFiledState createState() => _RoundedPasswordFiledState();
}

class _RoundedPasswordFiledState extends State<RoundedPasswordFiled> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: !visible,
        onChanged: widget.onChanged,
        style: const TextStyle(color: kNegativeColor),
        cursorColor: Colors.red,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: const TextStyle(color: kNegativeColor),
          icon: const Icon(
            Icons.lock,
            color: kNegativeColor,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
              icon: Icon(
                visible ? Icons.visibility_off : Icons.visibility,
                color: kNegativeColor,
              )),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
