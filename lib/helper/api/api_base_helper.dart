// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'app_exception.dart';

class ApiBaseHelper {
  final String _baseUrl = "103.90.25.146:44225";

  Future<dynamic> execute(context, String method, String uri,
      [String? params]) async {
    try {
      // print(uri);
      if (method == 'post') {
        return post(context, uri, params);
      } else {
        return get(context, uri);
      }
    } on SocketException {
      try {
        var url = Uri.http('google.com', '');
        await http.get(
          url,
        );
        throw FetchDataException(
            'Terjadi kesalahan saat Berkomunikasi dengan Server');
      } on SocketException {
        throw FetchDataException('Tidak ada koneksi internet');
      }
    }
  }

  Future<dynamic> get(context, String uri) async {
    var responseJson;
    try {
      Future<SharedPreferences> prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs_ = await prefs;
      var url = Uri.http(_baseUrl, uri);
      var response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
      );
      responseJson = _returnResponse(context, response);
    } on SocketException {
      try {
        var url = Uri.http('google.com', '');
        await http.get(
          url,
        );
        var message = 'Terjadi kesalahan saat Berkomunikasi dengan Server';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ));

        throw FetchDataException(message);
      } on SocketException {
        var message = 'Tidak ada koneksi internet';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ));
        throw FetchDataException(message);
      }
    }
    return responseJson;
  }

  Future<dynamic> post(context, String uri, params) async {
    var responseJson;
    try {
      Future<SharedPreferences> prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs_ = await prefs;
      var url = Uri.http(_baseUrl, uri);
      print(url);
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization':
              'Bearer ${(prefs_.getString('token') == null) ? "" : prefs_.getString('token')}',
        },
        body: params,
      );
      responseJson = _returnResponse(context, response);
    } on SocketException {
      try {
        var url = Uri.http('google.com', '');
        await http.get(
          url,
        );
        var message = 'Terjadi kesalahan saat Berkomunikasi dengan Server';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ));

        throw FetchDataException(message);
      } on SocketException {
        var message = 'Tidak ada koneksi internet';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
        ));
        throw FetchDataException(message);
      }
    }
    return responseJson;
  }

  dynamic _returnResponse(context, http.Response response) {
    // print(response.body);
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
      case 401:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(convert.jsonDecode(response.body)['status'].toString()),
          behavior: SnackBarBehavior.floating,
        ));
        throw BadRequestException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 405:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(convert.jsonDecode(response.body)['error'].toString()),
          behavior: SnackBarBehavior.floating,
        ));
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Internal Server Error"),
          behavior: SnackBarBehavior.floating,
        ));
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
