import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'connections.dart';

class CreateproductApi {
  static var client = http.Client();

  static createproduct(String name, String description, int price, int quantity,
      Uint8List productimg, int barcode) async {
    var uri = Uri.parse(Connection.uplaodpic);

    var request = http.MultipartRequest('POST', uri);

    List<int> list = productimg.cast();
    request.files
        .add(http.MultipartFile.fromBytes("ppic", list, filename: "myimg.png"));

    var result = await request.send();
    var picnaem = "";
    result.stream.bytesToString().asStream().listen((event) {
      picnaem = event;
    });
    cp(name, description, price, quantity, picnaem, barcode);
    return result;
  }

  static cp(String name, String description, int price, int quantity,
      String productimg, int barcode) async {
    Map<String, dynamic> data = {
      "pname": name,
      "pdescr": description,
      "ppic": productimg,
      "pbarcode": barcode,
      "pprice": price,
      "pquantity": quantity
    };
    var result = await client
        .post(
            Uri.parse(
              Connection.createproduct,
            ),
            body: data)
        .then((value) {
      print(value.body);
    });
  }
}
