import 'package:flutter/material.dart';
import 'package:movie/components/text_filed_container.dart';
import 'package:movie/constants.dart';

class RoundedInputText extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputText({
    Key? key,
    this.hintText = "Hint Text",
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: kNegativeColor),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kNegativeColor,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: kNegativeColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
