import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../Model/vender_model.dart';
import 'connections.dart';

class VenderStatus {
  static var client = http.Client();
  static var dio = Dio();

  static approve(String email) async {
    await dio.post(Connection.acceptvender,
        data: {"email": email}).then((value) => {log(value.data)});
  }

  static reject(String email) async {
    await dio.post(Connection.rejectvender,
        data: {"email": email}).then((value) => {log(value.data)});
  }

  static approvedvender() async {
    List<VenderModel> model = [];
    try {
      await client
          .get(Uri.parse(Connection.getapprovedvender))
          .then((value) => {
                for (var item in json.decode(value.body))
                  model.add(VenderModel.fromJson(item)),
              });
    } catch (e) {
      log("approve$e");
    }
    return model;
  }

  static pendingvender() async {
    List<VenderModel> model = [];
    try {
      await client.get(Uri.parse(Connection.getpendingvender)).then((value) => {
            if (value.body == "[]")
              {
                model = [],
              }
            else
              for (var item in json.decode(value.body))
                model.add(VenderModel.fromJson(item)),
          });
    } catch (e) {
      log("pen$e");
    }
    return model;
  }

  static statuschange(String email, bool status) async {
    await dio.post(Connection.statusvender,
        data: {"email": email, "status": status}).then((value) => {});
    return "Done";
  }
}
