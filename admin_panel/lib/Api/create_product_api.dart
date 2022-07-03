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
    request.fields["pname"] = name;
    request.fields["pdescr"] = description;

    request.fields["pbarcode"] = barcode.toString();
    request.fields["pprice"] = price.toString();
    request.fields["pquantity"] = quantity.toString();
    var result = await request.send().then((value) => {print(value.stream)});

    return result;
  }
}
