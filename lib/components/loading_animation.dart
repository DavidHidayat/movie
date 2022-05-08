import 'package:flutter/material.dart';
import 'package:movie/constants.dart';

class LoadingAnimation extends StatelessWidget {
  final String title;
  const LoadingAnimation({
    Key? key,
    this.title = 'Tunggu..',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            backgroundColor: kBlackColor,
            color: kNegativeColor,
          ),
          Text(title),
        ],
      ),
    );
  }
}
