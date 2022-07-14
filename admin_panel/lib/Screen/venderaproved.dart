import 'dart:developer';

import 'package:admin_panel/Screen/vender_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/venders_list_controller.dart';

class VenderApprovedList extends StatefulWidget {
  const VenderApprovedList({Key? key}) : super(key: key);

  @override
  State<VenderApprovedList> createState() => _VenderApprovedListState();
}

class _VenderApprovedListState extends State<VenderApprovedList> {
  final vendercontroller = Get.put(VendersController());
  @override
  void initState() {
    log("hehe");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vendors List",
            style: GoogleFonts.lato(fontSize: 35, color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Approved  Vendors Data",
                  style: GoogleFonts.lato(fontSize: 15, color: Colors.blue),
                ),
              ),
              const Divider(
                thickness: 4,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    "Name",
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    "Email",
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    "Phone",
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    "Status",
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
              const SizedBox(height: 10),
              GetX<VendersController>(builder: (controller) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.approvedvender.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (controller.approvedvender[0].name == null) {
                        return Center(
                          child: Text(
                            "data Not Found",
                            style: GoogleFonts.lato(
                                fontSize: 35, color: Colors.black),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        Get.to(() => VenderInfo(index)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Row(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: Card(
                                                elevation: 10,
                                                color: Colors.white38,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Image.network(controller
                                                    .approvedvender[index]
                                                    .profilePic!),
                                              ),
                                            ),
                                            Text(
                                              controller
                                                  .approvedvender[index].name!,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.lato(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )),
                                        Expanded(
                                            child: Text(
                                          controller
                                              .approvedvender[index].email!,
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        )),
                                        Expanded(
                                            child: Text(
                                          controller
                                              .approvedvender[index].phone!,
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        )),
                                        Expanded(
                                            child: Text(
                                          controller
                                                  .approvedvender[index].active!
                                              ? "Active"
                                              : "InActive",
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      }
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
