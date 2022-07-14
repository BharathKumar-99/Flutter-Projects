import 'dart:convert';
import 'dart:developer';

import 'package:admin_panel/Controller/venders_list_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/vender_model.dart';
import 'connections.dart';

class VenderStatus {
  static var client = http.Client();
  static var dio = Dio();

  static approve(String email) async {
    await dio.post(Connection.acceptvender,
        data: {"email": email}).then((value) => {log(value.data)});
    Get.find<VendersController>().relaod();
  }

  static reject(String email) async {
    await dio.post(Connection.rejectvender,
        data: {"email": email}).then((value) => {log(value.data)});
    Get.find<VendersController>().relaod();
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
            log(value.body),
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

  static statuschange(String email, bool status, int index) async {
    int indexs = index;
    await dio.post(Connection.statusvender,
        data: {"email": email, "status": status}).then((value) => {});
    Get.find<VendersController>().relaod();

    log(indexs.toString());
    return indexs;
  }
}
