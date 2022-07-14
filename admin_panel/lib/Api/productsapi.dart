import 'dart:convert';
import 'dart:developer';

import 'package:admin_panel/Api/connections.dart';
import 'package:admin_panel/Controller/productscontroller.dart';
import 'package:admin_panel/Model/productmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductsRest {
  static var client = http.Client();

  static getproducts() async {
    List<ProductsModel> model = [];
    try {
      await client.get(Uri.parse(Connection.getallproduct)).then((val) {
        for (final item in json.decode(val.body)) {
          model.add(ProductsModel.fromJson(item));
        }
      });
    } catch (e) {
      log("pro$e");
    }
    return model;
  }

  static updatequantity(String id, String quantity) async {
    try {
      await client.post(Uri.parse(Connection.setproductquantity),
          body: {"Barcode": id, "quantity": quantity}).then((val) {
        return "yes";
      });
    } catch (e) {
      log(e.toString());
    }
  }

  static delete(String barcode) async {
    try {
      await client.delete(Uri.parse(Connection.deleteproduct),
          body: {"barcode": barcode}).then((val) {
        print(val.body); // successfully
      });
      Get.find<ProductController>().relaod();
    } catch (e) {
      log(e.toString());
    }
  }
}
