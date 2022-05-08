import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String api_base_url = "103.90.25.146:44225";
String image_base_url = "http://103.90.25.146:44225/monitoring/assets/img/";
const kPrimaryColor = Color(0xFFA7FF0D);
const kPrimaryLightColor = Color(0xFFc8fb6f);
const kSecondaryColor = Color(0xFF02167f);
const kNegativeColor = Color(0xFFd7af57);
const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF000000);
const kBlackColorLight = Color.fromARGB(255, 77, 77, 77);

const Color app_red = Color(0xFFd91a22);
const Color app_blue = Color(0xFF0b479b);
const Color app_blue_light = Color(0xAD0B479B);
const Color app_white = Color(0xFFfafafa);
const Color app_grey = Color(0XFFdee2e6);

const Color app_info = Color(0XFFBDE5F8);
const Color app_success = Color(0XFFDFF2BF);
const Color app_warning = Color(0XFFFEEFB3);
const Color app_error = Color(0XFFFFD2D2);

const MaterialColor mColorMajBlue = const MaterialColor(
  0xFF0b479b,
  const <int, Color>{
    50: app_blue,
    100: app_blue,
    200: app_blue,
    300: app_blue,
    400: app_blue,
    500: app_blue,
    600: app_blue,
    700: app_blue,
    800: app_blue,
    900: app_blue,
  },
);

const double paddingSmall = 8;
const double paddingMedium = 10;
const double paddingLarge = 16;

paddingAll(double value) => EdgeInsets.all(value);
paddingLeft(double value) => EdgeInsets.only(left: value);
paddingTop(double value) => EdgeInsets.only(top: value);
paddingRight(double value) => EdgeInsets.only(right: value);
paddingBottom(double value) => EdgeInsets.only(bottom: value);
paddingHorizontal(double value) => EdgeInsets.symmetric(horizontal: value);
paddingVertical(double value) => EdgeInsets.symmetric(vertical: value);

DateFormat dfApi = DateFormat('y-MM-dd');
DateFormat dfApi2 = DateFormat('yMMdd');
DateFormat dfApp = DateFormat('MMMM yyyy', "id_ID");
DateFormat dfApp2 = DateFormat('dd MMMM yyyy', "id_ID");
DateFormat dfApp3 = DateFormat('EE, dd MMMM yyyy', "id_ID");
DateFormat dfMySql = DateFormat('y-MM-dd H:m:s');
DateFormat dfSap = DateFormat('yMM');
