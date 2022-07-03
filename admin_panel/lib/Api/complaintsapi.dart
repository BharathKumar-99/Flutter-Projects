import 'dart:convert';
import 'dart:developer';

import 'package:admin_panel/Api/connections.dart';
import 'package:admin_panel/Model/complaintsmodel.dart';
import 'package:http/http.dart' as http;

class ComplaintsApi {
  static var client = http.Client();

  static getcomplaints() async {
    List<ComplaintsModel> model = [];
    try {
      await client.get(Uri.parse(Connection.getcomplaints)).then((val) {
        print(val.body);
        for (final item in json.decode(val.body)) {
          model.add(ComplaintsModel.fromJson(item));
        }
      });
    } catch (e) {
      log("pro$e");
    }
    return model;
  }
}
