// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie/Screen/Login/components/background.dart';
import 'package:movie/components/loading_animation.dart';
import 'package:movie/components/rounded_button.dart';
import 'package:movie/components/rounded_input_field.dart';
import 'package:movie/components/rounded_password_filed.dart';
import 'package:movie/constants.dart';
import 'dart:convert' as convert;

import 'package:movie/helper/api/api_base_helper.dart';
import 'package:movie/helper/google/google_login_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  final Orientation orientation;
  const Body({Key? key, required this.orientation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiBaseHelper api = ApiBaseHelper();
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    void _onLogin(String username, String password) async {
      final SharedPreferences prefs = await _prefs;

      var params = convert.jsonEncode(<String, String>{
        'identity': username,
        'password': password,
      });
      BuildContext dialogContext = context;
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            dialogContext = context;
            return WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                content: Wrap(
                  children: const [LoadingAnimation()],
                ),
              ),
            );
          });
      try {
        Response response = await api.execute(
            context, 'post', "/majsf_rest_api/mobile/auth/login", params);
        if (response.statusCode == 200) {
          Map<String, dynamic> res = convert.jsonDecode(response.body);
          prefs.setString('username', username);
          prefs.setString('password', password);
          prefs.setString('token', res['token'].toString());
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => MainScreen()),
          // );
        } else {
          Navigator.pop(dialogContext);
        }
      } catch (e) {
        Navigator.pop(dialogContext);
        // switch (e.toString()) {
        //   case "Terjadi kesalahan saat Berkomunikasi dengan Server":
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => ServerProblem(screen: LoginScreen()),
        //       ),
        //     );
        //     break;
        //   case "Tidak ada koneksi internet":
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => InternetProblem(screen: LoginScreen()),
        //       ),
        //     );
        //     break;
        //   default:
        // }
      }
    }

    Size size = MediaQuery.of(context).size;
    return Background(
      child: Container(
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            padding: paddingVertical(20),
            child: orientation == Orientation.portrait
                ? BodyPotrait(
                    size: size,
                    callback: (String username, String password) {
                      _onLogin(username, password);
                    },
                    ratio: 0.6,
                  )
                : BodyLandscape(
                    size: size,
                    callback: (String username, String password) {
                      _onLogin(username, password);
                    },
                    ratio: 0.4,
                  ),
          ),
        ),
      ),
    );
  }
}

class BodyPotrait extends StatelessWidget {
  const BodyPotrait({
    Key? key,
    required this.size,
    required this.callback,
    required this.ratio,
  }) : super(key: key);

  final Size size;
  final void Function(String, String) callback;
  final num ratio;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoginLogo(size: size, ratio: ratio),
        Consumer<GoogleSignInController>(
          builder: (context, model, child) {
            print("Login");
            if (model.googleSignInAccount != null) {
              return Column(
                children: [
                  const Text("Sudah Login"),
                  Text(model.googleSignInAccount!.email),
                  Text(model.googleSignInAccount!.id),
                  Text(model.googleSignInAccount!.displayName ?? ''),
                  Text(model.googleSignInAccount!.photoUrl ?? ''),
                  RoundedButton(
                    color: kBlackColor,
                    textColor: kNegativeColor,
                    text: "Logout",
                    press: () {
                      Provider.of<GoogleSignInController>(context,
                              listen: false)
                          .logout();
                      // widget.callback(tUsername, tPassword);
                    },
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: [
                        RoundedButton(
                          color: kBlackColor,
                          textColor: kNegativeColor,
                          text: "Sign in with Google",
                          imgSource: "assets/img/logo-google.png",
                          press: () {
                            Provider.of<GoogleSignInController>(context,
                                    listen: false)
                                .login();
                          },
                        ),
                        RoundedButton(
                          color: kBlackColor,
                          textColor: kNegativeColor,
                          text: "Sign in with Facebook",
                          imgSource: "assets/img/logo-facebook.png",
                          press: () {
                            Provider.of<GoogleSignInController>(context,
                                    listen: false)
                                .login();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        )
      ],
    );
  }
}

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    Key? key,
    required this.size,
    required this.ratio,
  }) : super(key: key);

  final Size size;
  final num ratio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingAll(paddingLarge),
      child: Image.asset(
        "assets/img/logo.png",
        width: size.width * ratio,
      ),
    );
  }
}

class BodyLandscape extends StatelessWidget {
  const BodyLandscape({
    Key? key,
    required this.size,
    required this.callback,
    required this.ratio,
  }) : super(key: key);

  final Size size;
  final void Function(String, String) callback;
  final num ratio;

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleSignInController>(
      builder: (context, model, child) {
        if (model.googleSignInAccount != null) {
          return const Text("Sudah Login");
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginLogo(size: size, ratio: ratio),
              Expanded(
                child: Column(
                  children: [
                    RoundedButton(
                      color: kBlackColor,
                      textColor: kNegativeColor,
                      text: "Masuk",
                      press: () {
                        // widget.callback(tUsername, tPassword);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
