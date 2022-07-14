// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../Model/dashboard_model.dart';
import '../Model/vender_model.dart';
import 'connections.dart';

class Api {
  static var client = http.Client();

  static getdashboardapi() async {
    List<DashboardModel> model = [];
    try {
      await client
          .get(
            Uri.parse(Connection.dashboard),
          )
          .then((value) => {
                for (final item in json.decode(value.body))
                  model.add(DashboardModel.fromJson(item)),
              });
    } catch (e) {
      log("this$e");
    }
    return model;
  }

  static getdashboardvender() async {
    List<VenderModel> model = [];
    try {
      await client.get(Uri.parse(Connection.dashboardvender)).then((value) => {
            for (var item in json.decode("[${value.body}]"))
              model.add(VenderModel.fromJson(item)),
          });
    } catch (e) {
      log("that$e");
    }
    return model;
  }
}
