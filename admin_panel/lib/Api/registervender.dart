import 'dart:convert';

import 'package:admin_panel/Api/connections.dart';
import 'package:http/http.dart' as http;

import '../Model/signupresponse.dart';

class RegisterVender {
  static var client = http.Client();
  static Future<String> signup(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    var data = {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      "pan_front": "not uploaded",
      "pan_back": "not uploaded",
      "aadhar_front": "not uploaded",
      "aadhar_back": "not uploaded",
    };

    String result = "";
    SignupResponse res = SignupResponse();

    try {
      await http
          .post(Uri.parse(Connection.registerapi),
              headers: {"Content-Type": "application/json"},
              body: json.encode(data))
          .then((value) => {
                print(value.statusCode),
                print(value.body),
                if (value.statusCode == 200)
                  {
                    res = SignupResponse.fromJson(json.decode(value.body)),
                    print(res.message),
                    if (res.message == "Registration Successful!")
                      {
                        result = "Registration Successful!",
                        //update shared prefrence
                      }
                    else if (res.message == "Document upload Pending")
                      {
                        result = "Document upload Pending",
                      }
                    else
                      {result = res.message.toString()}
                  }
              });
    } catch (e) {
      print(e);
    }
    return result;
  }
}
