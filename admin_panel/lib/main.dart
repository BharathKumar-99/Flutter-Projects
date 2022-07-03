import 'package:admin_panel/Controller/complaintcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/productscontroller.dart';
import 'Screen/sidenavscreen.dart';

void main() {
  runApp(const MyApp());

  final productController = Get.put(ProductController());
  final complaints = Get.put(ComplaintController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => const SideNavScreen()),
      ],
    );
  }
}
