// ignore_for_file: file_names

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/response.dart';

class Autologin {
  static void setLogin(
    ResponseModel model,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    ResponseModel user = model;
    prefs.setString('user', json.encode(user));
  }

  static Future<ResponseModel> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> jsondatais =
        jsonDecode(prefs.getString('user') ?? '{}');
    //convert it into User object
    ResponseModel user = ResponseModel.fromJson(jsondatais);
    if (user.name != null) {
      return user;
    } else {
      return user = ResponseModel();
    }
  }
}
