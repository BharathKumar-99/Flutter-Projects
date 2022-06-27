import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:ecommerce_website/Model/Dashboard.dart';
import 'package:ecommerce_website/Model/VendersModel.dart';
import 'package:ecommerce_website/Requests/Connection.dart';

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
            for (final item in json.decode(value.body))
              model.add(VenderModel.fromJson(item)),
          });
    } catch (e) {
      log("that$e");
    }
    return model;
  }
}
