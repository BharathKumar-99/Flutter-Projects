import 'dart:developer';

import 'package:admin_panel/Api/venderstatuschange.dart';
import 'package:admin_panel/Controller/venders_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VenderInfo extends StatefulWidget {
  final int index;
  const VenderInfo(this.index, {Key? key}) : super(key: key);

  @override
  State<VenderInfo> createState() => _VenderInfoState();
}

class _VenderInfoState extends State<VenderInfo> {
  final c = Get.put(VendersController());

  _changestatus(String value, bool status) async {
    await VenderStatus.statuschange(value, status).then((value) {
      setState(() {
        log("data");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: Obx(
                    () => Image.network(
                        c.approvedvender[widget.index].aadharFront!),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Name :${c.approvedvender[widget.index].name!}",
                        style: GoogleFonts.lato(fontSize: 20),
                      ),
                      Text(
                        "Email :${c.approvedvender[widget.index].email!}",
                        style: GoogleFonts.lato(fontSize: 20),
                      ),
                      Text(
                        "Phone :${c.approvedvender[widget.index].phone!}",
                        style: GoogleFonts.lato(fontSize: 20),
                      ),
                      Obx(
                        () => Text(
                          "Status :${c.approvedvender[widget.index].active! ? "Active" : "InActive"}",
                          style: GoogleFonts.lato(fontSize: 20),
                        ),
                      ),
                      Obx(
                        () => Switch(
                          value: c.approvedvender[widget.index].active!,
                          onChanged: (value) {
                            setState(() {
                              _changestatus(
                                c.approvedvender[widget.index].email!,
                                c.approvedvender[widget.index].active!,
                              );
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: const [],
          ))
        ],
      ),
    );
  }
}
