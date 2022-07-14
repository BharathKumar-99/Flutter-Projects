import 'dart:convert';
import 'dart:developer';

import 'package:admin_panel/Api/connections.dart';
import 'package:admin_panel/Model/customerlistmodel.dart';
import 'package:http/http.dart' as http;

class CustoemrApi {
  static var client = http.Client();

  static getcustmer() async {
    List<CustomerListModel> model = [];
    try {
      await client
          .get(
            Uri.parse(Connection.customerlist),
          )
          .then((value) => {
                print(value.body),
                for (var item in json.decode(value.body))
                  model.add(CustomerListModel.fromJson(item)),
              });
    } catch (e) {
      log(e.toString());
    }
    return model;
  }
}
