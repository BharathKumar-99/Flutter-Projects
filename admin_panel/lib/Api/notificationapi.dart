import 'dart:developer';

import 'package:http/http.dart' as http;

import 'connections.dart';

class NotificationsApi {
  static var client = http.Client();

  static sendnotification(String title, String body) async {
    try {
      await client.post(Uri.parse(Connection.sendnotification), body: {
        "title": title,
        "data": body
      }).then((value) => log(value.body));
    } catch (e) {
      log(e.toString());
    }
  }
}
