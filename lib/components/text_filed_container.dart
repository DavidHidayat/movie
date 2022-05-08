import 'package:flutter/material.dart';
import 'package:movie/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      margin: paddingVertical(paddingMedium),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: kBlackColorLight,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
