import 'package:admin_panel/Controller/complaintcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<ComplaintController>(builder: (controller) {
        return ListView.builder(
            itemCount: controller.complaintslist.length,
            itemBuilder: (BuildContext context, int index) {
              if (controller.complaintslist[0].email == null) {
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
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "By : ${controller.complaintslist[index].email}",
                                  style: GoogleFonts.lato(
                                      color: Colors.red,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Submited at : ${controller.complaintslist[index].date}",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  " ${controller.complaintslist[index].body}",
                                  style: GoogleFonts.lato(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                color: Colors.red,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )),
                              )
                            ]),
                          ],
                        ),
                      )),
                );
              }
            });
      }),
    );
  }
}
