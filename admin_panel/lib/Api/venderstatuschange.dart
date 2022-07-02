import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../Model/vender_model.dart';
import 'connections.dart';

class VenderStatus {
  static var client = http.Client();

  static approve(String email) async {
    await client.post(Uri.parse(Connection.acceptvender),
        body: {email: email}).then((value) => {log(value.body)});
  }

  static reject(String email) async {
    await client.post(Uri.parse(Connection.rejectvender),
        body: {email: email}).then((value) => {log(value.body)});
  }

  static approvedvender() async {
    List<VenderModel> model = [];
    await client.get(Uri.parse(Connection.getapprovedvender)).then((value) => {
          print(value.body),
        });
  }

  static pendingvender() async {
    List<VenderModel> model = [];
    try {
      await client.get(Uri.parse(Connection.getpendingvender)).then((value) => {
            print(value.body),
            for (var item in json.decode("[${value.body}]"))
              model.add(VenderModel.fromJson(item)),
          });
    } catch (e) {
      log(e.toString());
    }
    return model;
  }
}
