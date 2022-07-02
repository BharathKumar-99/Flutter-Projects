import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/Widgets.dart';

class KycVerification extends StatefulWidget {
  const KycVerification({Key? key}) : super(key: key);

  @override
  State<KycVerification> createState() => _KycVerificationState();
}

class _KycVerificationState extends State<KycVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
              )),
          Expanded(
            flex: 3,
            child: Card(
              color: Colors.grey,
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 250,
                          width: 250,
                          child: FittedBox(child: venderProfileImage()),
                        ),
                        const Vender_Name(),
                      ],
                    ),
                    Text(
                      "Email id: someone@something.com",
                      style: GoogleFonts.lato(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "Phone:7896541320",
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
          ),
        ],
      ),
    );
  }
}

class Vender_Name extends StatelessWidget {
  const Vender_Name({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "VenderName",
      style: GoogleFonts.lato(
          fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}
