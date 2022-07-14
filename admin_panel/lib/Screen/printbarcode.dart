import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../Controller/productscontroller.dart';

class PrintBarcode extends StatelessWidget {
  final int index;
  PrintBarcode({Key? key, required this.index}) : super(key: key);
  final productcontroller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Card(
            child: SizedBox(
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SfBarcodeGenerator(
                  value:
                      productcontroller.productctl[index].barcode!.toString(),
                ),
              ),
            ),
          ),
        ),
        Text(
          productcontroller.productctl[index].barcode!.toString(),
          style: GoogleFonts.lato(fontSize: 25),
        )
      ]),
    );
  }
}
