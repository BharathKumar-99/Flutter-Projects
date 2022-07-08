import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../Api/create_product_api.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  TextEditingController productnamectl = TextEditingController();
  TextEditingController productpricectl = TextEditingController();
  TextEditingController productdescriptionctl = TextEditingController();
  TextEditingController productquantityctl = TextEditingController();
  var iamgeselected = "Please Select an Image";
  var image;
  File _file = File("zz");
  Uint8List webImage = Uint8List(10);
  _getphoto() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var f = await image.readAsBytes();
      setState(() {
        _file = File("a");
        webImage = f;
        iamgeselected = image.name;
      });
    } else {}
  }

  int barcodegenerator() {
    var number = "";
    var randomnumber = Random();
    //chnage i < 15 on your digits need
    for (var i = 0; i < 15; i++) {
      number = number + randomnumber.nextInt(9).toString();
    }

    return int.parse(number);
  }

  Future _createproduct() async {
    if (productnamectl.text == "" ||
        productdescriptionctl.text == "" ||
        productpricectl.text == "" ||
        productquantityctl.text == "") {
      Get.defaultDialog(
          title: "error",
          middleText: "Enter All Details",
          backgroundColor: Colors.blue,
          titleStyle: const TextStyle(color: Colors.white),
          middleTextStyle: const TextStyle(color: Colors.white),
          radius: 30);
    } else {
      int barcode = barcodegenerator();
      await CreateproductApi.createproduct(
              productnamectl.text.toString(),
              productdescriptionctl.text.toString(),
              int.parse(productpricectl.text),
              int.parse(productquantityctl.text),
              webImage,
              barcode)
          .then((value) {
        Get.defaultDialog(
            title: "Sucess",
            middleText: "Product Created",
            backgroundColor: Colors.blue,
            titleStyle: const TextStyle(color: Colors.white),
            middleTextStyle: const TextStyle(color: Colors.white),
            radius: 30);
        productnamectl.text = "";
        productdescriptionctl.text = "";
        productpricectl.text = "";
        productquantityctl.text = "";
        webImage.clear();
        barcode = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Colors.teal, Colors.white])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Bar Code Generator",
                          style: GoogleFonts.lato(fontSize: 25),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: productnamectl,
                        style: GoogleFonts.lato(),
                        decoration: const InputDecoration(
                            hintText: "Product Name",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        style: GoogleFonts.lato(),
                        controller: productpricectl,
                        decoration: const InputDecoration(
                            hintText: "Product Price",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: productdescriptionctl,
                        style: GoogleFonts.lato(),
                        decoration: const InputDecoration(
                            hintText: "Product Description",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: productquantityctl,
                        style: GoogleFonts.lato(),
                        decoration: const InputDecoration(
                            hintText: "Product quantity",
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: ElevatedButton(
                                onPressed: _getphoto,
                                child: const Text("Choose Photo")),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(iamgeselected)
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: _createproduct,
                            child: const Text("Create Product")),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
