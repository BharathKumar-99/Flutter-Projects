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
    vendercontroller.loaddata();
  }

  _rejected(String email) async {
    vendercontroller.loaddata();
    await VenderStatus.reject(email).then((val) {});
    vendercontroller.loaddata();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: GetX<VendersController>(
            init: VendersController(),
            builder: (controller) => ListView.builder(
                itemCount: controller.kycpending.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                        color: Colors.blueAccent,
                        child: Column(
                          children: [
                            Text(
                              "Name : ${controller.kycpending[index].name!}",
                              style: GoogleFonts.lato(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Email : ${controller.kycpending[index].email!}",
                              style: GoogleFonts.lato(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Phone : ${controller.kycpending[index].phone!}",
                              style: GoogleFonts.lato(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Image.network(
                                      controller.kycpending[index].panFront!),
                                ),
                                Expanded(
                                  child: Image.network(controller
                                      .kycpending[index].aadharFront!),
                                ),
                                Expanded(
                                  child: Image.network(
                                      controller.kycpending[index].aadharBack!),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () => _rejected(
                                      controller.kycpending[index].email!),
                                  style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      primary: Colors.red,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 20),
                                      textStyle: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: const Text('Reject'),
                                ),
                                ElevatedButton(
                                  onPressed: () => _approve(
                                      controller.kycpending[index].email!),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 20),
                                      textStyle: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                  child: const Text('Approve'),
                                ),
                              ],
                            )
                          ],
                        )),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
