import 'package:admin_panel/Controller/productscontroller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final productcontroller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    print(productcontroller.productctl.length);
    return SizedBox(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productcontroller.productctl.length,
          itemBuilder: (BuildContext context, int index) {
            return Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    color: const Color.fromARGB(94, 33, 149, 243),
                    margin: EdgeInsets.zero,
                    elevation: 0.4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.network(
                                  productcontroller.productctl[index].pic!)),
                          const SizedBox(height: 10),
                          Text(
                            productcontroller.productctl[index].name!,
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Rs: ${productcontroller.productctl[index].price!}",
                            style: GoogleFonts.lato(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "X${productcontroller.productctl[index].quantity!}",
                            style: GoogleFonts.lato(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
