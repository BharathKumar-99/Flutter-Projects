import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Api/venderstatuschange.dart';
import '../Controller/venders_list_controller.dart';

class VenderApprovedList extends StatefulWidget {
  const VenderApprovedList({Key? key}) : super(key: key);

  @override
  State<VenderApprovedList> createState() => _VenderApprovedListState();
}

class _VenderApprovedListState extends State<VenderApprovedList> {
  final vendercontroller = Get.put(VendersController());
  _rejected(String email) async {
    await VenderStatus.reject(email).then((val) {});
    vendercontroller.loaddata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Venders List"),
      ),
      body: GetX<VendersController>(builder: (controller) {
        return ListView.builder(
            itemCount: controller.approvedvender.length,
            itemBuilder: (BuildContext context, int index) {
              if (controller.approvedvender[0].name == null) {
                return Center(
                  child: Text(
                    "data Not Found",
                    style: GoogleFonts.lato(fontSize: 35, color: Colors.black),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                      color: Colors.blueAccent,
                      child: Column(
                        children: [
                          Text(
                            "Name : ${controller.approvedvender[index].name!}",
                            style: GoogleFonts.lato(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Email : ${controller.approvedvender[index].email!}",
                            style: GoogleFonts.lato(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Phone : ${controller.approvedvender[index].phone!}",
                            style: GoogleFonts.lato(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Image.network(
                                    controller.approvedvender[index].panFront!),
                              ),
                              Expanded(
                                child: Image.network(controller
                                    .approvedvender[index].aadharFront!),
                              ),
                              Expanded(
                                child: Image.network(controller
                                    .approvedvender[index].aadharBack!),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () => _rejected(
                                controller.approvedvender[index].email!),
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                primary: Colors.red,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                textStyle: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            child: const Text('Reject'),
                          ),
                        ],
                      )),
                );
              }
            });
      }),
    );
  }
}
