import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/dashboard_controller.dart';

class Verification extends StatefulWidget {
  var index;

  Verification(this.index, {Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final vendercontroller = Get.find<DashBoardController>();

  @override
  Widget build(BuildContext context) {
    var index = widget.index;
    return Scaffold(
      body: Card(
        color: Colors.grey,
        child: Center(
          child: Column(
            children: [
              Text(vendercontroller.kycpending[index].name!),
              Text(
                "Email id: ${vendercontroller.kycpending[index].name!}",
                style: GoogleFonts.lato(
                  fontSize: 25,
                ),
              ),
              Text(
                "Phone: ${vendercontroller.kycpending[index].name!}",
                style: GoogleFonts.lato(
                  fontSize: 25,
                ),
              ),
              Text(
                "Documents",
                style: GoogleFonts.lato(
                  fontSize: 25,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Image.network(
                        "https://5.imimg.com/data5/SELLER/Default/2021/9/AJ/HJ/RZ/16989186/pvc-blank-pan-card-500x500.jpg"),
                  ),
                  Expanded(
                    child: Image.network(
                        "https://5.imimg.com/data5/SELLER/Default/2021/9/AJ/HJ/RZ/16989186/pvc-blank-pan-card-500x500.jpg"),
                  ),
                  Expanded(
                    child: Image.network(
                        "https://5.imimg.com/data5/SELLER/Default/2021/9/AJ/HJ/RZ/16989186/pvc-blank-pan-card-500x500.jpg"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
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
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    child: const Text('Approve'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
