import 'dart:developer';

import 'package:adminexebition/Utils/Connections.dart';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

class VenderApi {
  static var client = http.Client();
  static var dio = Dio();

  static getactivevenders() async {
    await client
        .get(Uri.parse(con.getsubadmin))
        .then((value) => {log(value.body)});
  }
}
