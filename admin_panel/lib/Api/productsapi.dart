import 'dart:convert';
import 'dart:developer';

import 'package:admin_panel/Api/connections.dart';
import 'package:admin_panel/Model/productmodel.dart';
import 'package:http/http.dart' as http;

class ProductsRest {
  static var client = http.Client();

  static getproducts() async {
    List<ProductsModel> model = [];
    try {
      await client.get(Uri.parse(Connection.getallproduct)).then((val) {
        print(val.body);
        for (final item in json.decode(val.body)) {
          model.add(ProductsModel.fromJson(item));
        }
      });
    } catch (e) {
      log("pro$e");
    }
    return model;
  }
}
