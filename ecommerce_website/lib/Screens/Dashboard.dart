import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ecommerce_website/Utils/Dimentions.dart';

import '../Controllers/Dashboard.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final cartController = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(153, 216, 216, 216),
      body: ListView(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            title: ElevatedButton(
              child: const Text("Generate Barcode"),
              onPressed: () {},
            ),
            actions: const [
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                  child: Text(
                    "Name",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              "DashBoard",
              style: GoogleFonts.comfortaa(
                  fontSize: 25, fontWeight: FontWeight.w900),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: Dimentions.height150,
                width: Dimentions.width100,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          color: Colors.blueAccent,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "TOTAL ITEM SOLD",
                                  style: GoogleFonts.lato(
                                      fontSize: 15, color: Colors.purple),
                                ),
                                Obx(() =>
                                    Text("${cartController.totalsolditem}"))
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                            child: Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                          size: 50,
                        ))
                      ],
                    )),
              ),
              SizedBox(
                height: Dimentions.height150,
                width: Dimentions.width100,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          color: Colors.green,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "EARNINGS ",
                                  style: GoogleFonts.lato(
                                      fontSize: 15, color: Colors.green),
                                ),
                                Obx(() =>
                                    Text("Rs ${cartController.totalrevenue}"))
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                            child: Icon(
                          Icons.monetization_on,
                          color: Colors.grey,
                          size: 50,
                        ))
                      ],
                    )),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: Dimentions.height150,
                width: Dimentions.width100,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          color: Colors.greenAccent,
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "TOTAL VENDERS",
                                  style: GoogleFonts.lato(
                                      fontSize: 15, color: Colors.greenAccent),
                                ),
                                Obx(() =>
                                    Text("${cartController.totalvenders}"))
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                            child: Icon(
                          Icons.list,
                          color: Colors.grey,
                          size: 50,
                        ))
                      ],
                    )),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: Dimentions.width100,
                child: SfCartesianChart(
                    // Initialize category axis
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<SalesData, String>>[
                      LineSeries<SalesData, String>(
                          // Bind data source
                          dataSource: <SalesData>[
                            SalesData('Jan', 35),
                            SalesData('Feb', 28),
                            SalesData('Mar', 34),
                            SalesData('Apr', 32),
                            SalesData('May', 40)
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales)
                    ]),
              ),
              SizedBox(
                width: Dimentions.width100,
                child: SfCartesianChart(
                    // Initialize category axis
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<SalesData, String>>[
                      LineSeries<SalesData, String>(
                          // Bind data source
                          dataSource: <SalesData>[
                            SalesData('Jan', 35),
                            SalesData('Feb', 28),
                            SalesData('Mar', 34),
                            SalesData('Apr', 32),
                            SalesData('May', 40)
                          ],
                          xValueMapper: (SalesData sales, _) => sales.year,
                          yValueMapper: (SalesData sales, _) => sales.sales)
                    ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SalesData {
  var year;

  var sales;

  SalesData(String s, int i);
}
