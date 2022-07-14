import 'package:admin_panel/Screen/customerdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/customercontrller.dart';

class CustmerDetails extends StatefulWidget {
  const CustmerDetails({Key? key}) : super(key: key);

  @override
  State<CustmerDetails> createState() => _CustmerDetailsState();
}

class _CustmerDetailsState extends State<CustmerDetails> {
  final vendercontroller = Get.put(CustmerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<CustmerController>(builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Customer List",
                      style:
                          GoogleFonts.lato(fontSize: 35, color: Colors.black)),
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
                  ],
                ),
                const SizedBox(height: 10),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.customerctl.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (controller.customerctl[0].name == null) {
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
                                        Get.to(() => CustomerInfo(index)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Row(
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              child: Text(
                                                controller
                                                    .customerctl[index].name!,
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
                                          controller.customerctl[index].email!,
                                          style: GoogleFonts.lato(
                                              fontSize: 18,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        )),
                                        Expanded(
                                            child: Text(
                                          controller.customerctl[index].phone!,
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
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
