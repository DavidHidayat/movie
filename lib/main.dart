import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie/Screen/Login/login_screen.dart';
import 'package:movie/Screen/Splash/splash_screen.dart';
import 'package:movie/constants.dart';
import 'package:movie/helper/google/google_login_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInController(),
          child: LoginScreen(),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: [const Locale('en'), const Locale('id')],
        debugShowCheckedModeBanner: false,
        title: 'MAJ Mobile',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textSelectionTheme: TextSelectionThemeData(cursorColor: app_red),
            fontFamily: 'Montserrat',
            backgroundColor: kBlackColor),
        home: SplashScreen(),
      ),
    );
  }
}
