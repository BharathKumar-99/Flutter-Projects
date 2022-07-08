import 'dart:developer';

import 'package:admin_panel/Api/productsapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import '../Controller/productscontroller.dart';

class ProductInfoPage extends StatefulWidget {
  final int index;

  const ProductInfoPage({Key? key, required this.index}) : super(key: key);

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  int quantity = 0;
  final productcontroller = Get.find<ProductController>();

  _addquantity() {
    setState(() {
      quantity = quantity + 1;
    });
  }

  _subquantity() {
    setState(() {
      quantity = quantity - 1;
    });
  }

  _init() {
    quantity = productcontroller.productctl[widget.index].quantity!;
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  _updatequantity() async {
    await ProductsRest.updatequantity(
            productcontroller.productctl[widget.index].barcode!.toString(),
            quantity.toString())
        .then((val) {
      productcontroller.loaddata();
    });
  }

  @override
  Widget build(BuildContext context) {
    log(productcontroller.productctl[widget.index].barcode!.toString());

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(children: [
                Column(
                  children: [
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: Card(
                        elevation: 10,
                        color: Colors.white38,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                            productcontroller.productctl[widget.index].pic!),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          productcontroller.productctl[widget.index].name!,
                          style: GoogleFonts.lato(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Text(
                          "Price: ${productcontroller.productctl[widget.index].price!}",
                          style: GoogleFonts.lato(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 20,
                                child: GestureDetector(
                                    onTap: _subquantity,
                                    child: const Icon(Icons.remove,
                                        color: Colors.white)),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Quantity: $quantity",
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 20,
                                child: GestureDetector(
                                    onTap: _addquantity,
                                    child: const Icon(Icons.add,
                                        color: Colors.white)),
                              ),
                            ]),
                        ElevatedButton(
                            onPressed: () => _updatequantity(),
                            child: const Text("Update")),
                        Text(
                          "Product Description",
                          style: GoogleFonts.lato(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          productcontroller
                              .productctl[widget.index].description!
                              .toString(),
                          style: GoogleFonts.lato(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Card(
                        child: SizedBox(
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SfBarcodeGenerator(
                              value: productcontroller
                                  .productctl[widget.index].barcode!
                                  .toString(),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Print Barcode"))
                    ],
                  ),
                ),
              ]),
            ]),
          ],
        ),
      ),
    );
  }
}
