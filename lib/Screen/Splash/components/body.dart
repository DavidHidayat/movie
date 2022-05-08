import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie/Screen/Login/login_screen.dart';
import 'package:movie/Screen/Splash/components/background.dart';
import 'package:movie/components/loading_animation.dart';
import 'package:movie/constants.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    print("SPLASH");
    Timer(const Duration(seconds: 3), () async {
      print("SPLASH 1");
      Future.delayed(Duration.zero, () {
        print("SPLASH 2");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = (size.width < size.height) ? size.width : size.height;

    return Background(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: size.height * 0.3,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Image.asset(
                    "assets/img/logo.png",
                    width: width * 0.6,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const LoadingAnimation(
                    title: "",
                  )
                ],
              ),
            ),
          ),
          const Positioned.fill(
            bottom: 70,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'from',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kNegativeColor,
                ),
              ),
            ),
          ),
          const Positioned.fill(
            bottom: 50,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'David Hidayat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
