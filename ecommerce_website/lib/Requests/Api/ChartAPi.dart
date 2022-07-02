import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Connection.dart';

class ProductApi {
  static var client = http.Client();

  static Future<String> getweeklist() async {
    String weeklist = "";
    try {
      http.Response response =
          await http.get(Uri.parse(Connection.getweeksales));
      weeklist = response.body;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return weeklist;
  }

  static Future<String> getdaylist() async {
    var responsestring = "";
    try {
      http.Response response =
          await http.get(Uri.parse(Connection.getdaysales));
      responsestring = response.body;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return responsestring;
  }

  static Future<String> getmonthlist() async {
    var responsestring = "";
    try {
      http.Response response =
          await http.get(Uri.parse(Connection.getmonthsales));
      responsestring = response.body;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return responsestring;
  }

  static Future<String> getyearlist() async {
    var responsestring = "";
    try {
      http.Response response =
          await http.get(Uri.parse(Connection.getyearsales));
      responsestring = response.body;
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return responsestring;
  }
}
