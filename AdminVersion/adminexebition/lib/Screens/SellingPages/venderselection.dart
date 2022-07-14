import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/ShoppingController.dart';
import '../../Controller/vendercontroller.dart';
import '../../Utils/Dimentions.dart';

class VenderSelection extends StatefulWidget {
  const VenderSelection({Key? key}) : super(key: key);

  @override
  State<VenderSelection> createState() => _VenderSelectionState();
}

class _VenderSelectionState extends State<VenderSelection> {
  bool isloading = false;
  var vendercontroller = Get.put(VenderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Details"),
      ),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Selected Items",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height10),
                    SizedBox(
                      height: Dimentions.height200,
                      width: Dimentions.width,
                      child: GetX<CartController>(builder: (controller) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.cartItems.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Card(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 10),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        // Image radius
                                        child: Image.network(
                                            controller.cartItems[index].pic ??
                                                "https://via.placeholder.com/350x150",
                                            fit: BoxFit.fill),
                                      ),
                                      Text(
                                        controller.cartItems[index].name!,
                                        style: GoogleFonts.lato(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            "Rs: ${controller.cartItems[index].price}",
                                            style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            )),
                                      ),
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.remove,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    controller.remove(index);
                                                  });
                                                },
                                              ),
                                              GetX<CartController>(
                                                  builder: (ctrl) {
                                                return Text(
                                                  ctrl.cartItems[index].quantity
                                                      .toString(),
                                                  style: GoogleFonts.lato(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                  ),
                                                );
                                              }),
                                              IconButton(
                                                icon: const Icon(Icons.add),
                                                onPressed: () {
                                                  setState(() {
                                                    controller.addtocart(
                                                        controller
                                                            .cartItems[index]);
                                                  });
                                                },
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                )),
                                SizedBox(
                                  width: Dimentions.width10,
                                ),
                              ],
                            );
                          },
                        );
                      }),
                    ),
                    SizedBox(height: Dimentions.height10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Select Subadmin",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimentions.height10),
                    SizedBox(height: Dimentions.height10),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              "Order Info",
                              style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: Dimentions.height40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Subcost ",
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                                GetX<CartController>(
                                  builder: (controller) {
                                    return Text(
                                      "Rs: ${controller.totalPrice}",
                                      style: GoogleFonts.lato(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900),
                                    );
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Taxes ",
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  "+ Rs: ${double.parse(((18 / 100) * Get.find<CartController>().totalPrice).toStringAsFixed(2))}",
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimentions.height20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total: ",
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  "Rs: ${double.parse((Get.find<CartController>().totalPrice + (18 / 100) * Get.find<CartController>().totalPrice).toStringAsFixed(2))} ",
                                  style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimentions.height10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                onPressed: () => {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                      "Place Order Rs: ${Get.find<CartController>().totalPrice + (18 / 100) * Get.find<CartController>().totalPrice}",
                                      style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
