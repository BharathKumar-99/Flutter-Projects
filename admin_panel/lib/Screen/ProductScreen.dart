import 'package:admin_panel/Controller/productscontroller.dart';
import 'package:admin_panel/Screen/productinfopage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Api/productsapi.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final productcontroller = Get.find<ProductController>();
  final pagecontroller = Get.find<PageController>();

  _remove(String Barcode) async {
    await ProductsRest.delete(Barcode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products List",
            style: GoogleFonts.lato(fontSize: 35, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                    "Price",
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    "Quantity",
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.white70,
                child: GetX<ProductController>(builder: (controller) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.productctl.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (controller.productctl[0].name == null) {
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
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => Get.to(() => ProductInfoPage(
                                        index: index,
                                      )),
                                  child: Row(
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
                                                child: Image.network(
                                                    productcontroller
                                                        .productctl[index]
                                                        .pic!),
                                              ),
                                            ),
                                            Text(
                                              controller
                                                  .productctl[index].name!,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.lato(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        controller.productctl[index].price!
                                            .toString(),
                                        style: GoogleFonts.lato(
                                            fontSize: 18, color: Colors.black),
                                        textAlign: TextAlign.center,
                                      )),
                                      Expanded(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            controller
                                                .productctl[index].quantity!
                                                .toString(),
                                            style: GoogleFonts.lato(
                                                fontSize: 18,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                          ),
                                          IconButton(
                                              onPressed: () => _remove(
                                                  controller
                                                      .productctl[index].barcode
                                                      .toString()),
                                              icon: const Icon(Icons.delete))
                                        ],
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
