import 'package:flutter/material.dart';
import 'package:movie/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final String imgSource;
  final VoidCallback press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kSecondaryColor,
    this.textColor = Colors.black,
    this.imgSource = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: paddingVertical(paddingMedium),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          ),
          onPressed: (press),
          child: imgSource != ""
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imgSource,
                      width: 20,
                    ),
                    Padding(padding: paddingHorizontal(paddingMedium)),
                    Text(text, style: TextStyle(color: textColor)),
                  ],
                )
              : Text(text, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
