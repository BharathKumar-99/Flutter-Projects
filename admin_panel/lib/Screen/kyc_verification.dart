import 'package:admin_panel/Api/venderstatuschange.dart';
import 'package:admin_panel/Controller/venders_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KycVerification extends StatefulWidget {
  const KycVerification({Key? key}) : super(key: key);

  @override
  State<KycVerification> createState() => _KycVerificationState();
}

class _KycVerificationState extends State<KycVerification> {
  final vendercontroller = Get.put(VendersController());
  _approve(String email) async {
    await VenderStatus.approve(email).then((val) {});
    setState(() {
      Get.delete<VendersController>();
      Get.put(VendersController());
    });
  }

  _view(int index) async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          elevation: 16,
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                const SizedBox(height: 20),
                const Center(child: Text('Documents')),
                const SizedBox(height: 20),
                Expanded(
                    child: Column(children: [
                  Image.network(vendercontroller.kycpending[index].panFront!),
                  Image.network(
                      vendercontroller.kycpending[index].aadharFront!),
                  Image.network(vendercontroller.kycpending[index].aadharBack!),
                ]))
              ],
            ),
          ),
        );
      },
    );
  }

  _rejected(String email) async {
    vendercontroller.loaddata();
    await VenderStatus.reject(email).then((val) {});
    vendercontroller.loaddata();
    setState(() {
      Get.delete<VendersController>();
      Get.put(VendersController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<VendersController>(builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Vendors List",
                      style:
                          GoogleFonts.lato(fontSize: 35, color: Colors.black)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "pending  Vendors Data",
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
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: Text(
                      "Email",
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: Text(
                      "Phone",
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
                    Expanded(
                        child: Text(
                      "Status",
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.kycpending.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (controller.kycpending[0].name == null) {
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                  .kycpending[index]
                                                  .profilePic!),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 80,
                                            child: Text(
                                              controller
                                                  .kycpending[index].name!,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.lato(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      )),
                                      Expanded(
                                          child: Text(
                                        controller.kycpending[index].email!,
                                        style: GoogleFonts.lato(
                                            fontSize: 18, color: Colors.black),
                                        textAlign: TextAlign.center,
                                      )),
                                      Expanded(
                                          child: Text(
                                        controller.kycpending[index].phone!,
                                        style: GoogleFonts.lato(
                                            fontSize: 18, color: Colors.black),
                                        textAlign: TextAlign.center,
                                      )),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                ElevatedButton(
                                                  onPressed: () => _rejected(
                                                      controller
                                                          .kycpending[index]
                                                          .email!),
                                                  style: ElevatedButton.styleFrom(
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                      primary: Colors.red,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 10),
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  child:
                                                      const Icon(Icons.close),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () => _approve(
                                                      controller
                                                          .kycpending[index]
                                                          .email!),
                                                  style: ElevatedButton.styleFrom(
                                                      primary: Colors.green,
                                                      shape: const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10,
                                                          vertical: 10),
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  child:
                                                      const Icon(Icons.check),
                                                ),
                                              ],
                                            ),
                                            ElevatedButton(
                                              onPressed: () => _view(index),
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.yellowAccent,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15))),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  textStyle: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              child: const Icon(
                                                Icons.remove_red_eye,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        );
                      }
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
