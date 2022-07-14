import 'package:admin_panel/Api/notificationapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  TextEditingController titlectl = TextEditingController();
  TextEditingController bodyctl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Colors.teal, Colors.white])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Create Notifications",
                          style: GoogleFonts.lato(fontSize: 25),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        controller: titlectl,
                        style: GoogleFonts.lato(),
                        decoration: const InputDecoration(
                            hintText: "Title of the notification",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        style: GoogleFonts.lato(),
                        controller: bodyctl,
                        decoration: const InputDecoration(
                            hintText: "Body of the notification",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: _sendmail,
                            child: const Text("Send Notifications")),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  _sendmail() async {
    if (titlectl.text != "" && bodyctl.text != "") {
      await NotificationsApi.sendnotification(
        titlectl.text.toString(),
        bodyctl.text.toString(),
      );
      titlectl.text = "";
      bodyctl.text = "";
    } else {
      Get.defaultDialog(
          title: "error",
          middleText: "Enter All Details",
          backgroundColor: Colors.blue,
          titleStyle: const TextStyle(color: Colors.white),
          middleTextStyle: const TextStyle(color: Colors.white),
          radius: 30);
    }
  }
}
