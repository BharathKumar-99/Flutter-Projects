// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/dashboard_controller.dart';
import '../Utils/daychart.dart';
import '../Utils/month_chart.dart';
import '../Utils/week_chart.dart';
import '../Utils/year_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var height_150,
      height_50,
      height_30,
      height_300,
      height_400,
      width_100,
      width_300,
      fontsize,
      width_70;
  final cartController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    height_50 = MediaQuery.of(context).size.height / 17.5;
    height_30 = MediaQuery.of(context).size.height / 28.5;
    height_150 = MediaQuery.of(context).size.height / 5.66;
    height_300 = MediaQuery.of(context).size.height / 3;
    height_400 = MediaQuery.of(context).size.height / 2;
    width_100 = MediaQuery.of(context).size.width / 3.7;
    width_300 = MediaQuery.of(context).size.width / 2;
    width_70 = MediaQuery.of(context).size.width / 5.7;
    fontsize = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: const Color.fromARGB(153, 216, 216, 216),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return webDashBoard();
        } else {
          return mobileDashBoard();
        }
      }),
    );
  }

  ListView webDashBoard() {
    return ListView(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          actions: [
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Text(
                  "Name",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 15.0 * fontsize, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            "DashBoard",
            style: GoogleFonts.lato(fontSize: 45, fontWeight: FontWeight.w900),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height_150,
              width: width_100,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "TOTAL ITEM SOLD",
                                style: GoogleFonts.lato(
                                    fontSize: 15.0, color: Colors.purple),
                              ),
                              Obx(() => Text("${cartController.totalsolditem}",
                                  style: GoogleFonts.lato(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)))
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
              height: height_150,
              width: width_100,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "EARNINGS ",
                                style: GoogleFonts.lato(
                                    fontSize: 15, color: Colors.green),
                              ),
                              Obx(() => Text(
                                  "Rs ${cartController.totalrevenue}",
                                  style: GoogleFonts.lato(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)))
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
              height: height_150,
              width: width_100,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "TOTAL VENDERS",
                                style: GoogleFonts.lato(
                                    fontSize: 15, color: Colors.greenAccent),
                              ),
                              Obx(() => Text(
                                  cartController.totalvenders.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)))
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
        SizedBox(
          height: height_50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: height_300,
              width: width_100,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const LineChartWidget()),
            ),
            SizedBox(
              height: height_300,
              width: width_100,
              child: const WeekChart(),
            ),
          ],
        ),
        SizedBox(
          height: height_50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: height_300,
              width: width_100,
              child: const MonthChart(),
            ),
            SizedBox(
              height: height_300,
              width: width_100,
              child: const YearChart(),
            ),
          ],
        ),
      ],
    );
  }

  ListView mobileDashBoard() {
    return ListView(
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
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height_150,
              width: width_300,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "TOTAL ITEM SOLD",
                                maxLines: 2,
                                style: GoogleFonts.lato(
                                    fontSize: 15.0, color: Colors.purple),
                              ),
                              Obx(() => Text("${cartController.totalsolditem}",
                                  style: GoogleFonts.lato(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)))
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                          child: Icon(
                        Icons.calendar_month,
                        color: Colors.grey,
                        size: 25,
                      ))
                    ],
                  )),
            ),
            SizedBox(
              height: height_150,
              width: width_300,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "EARNINGS ",
                                style: GoogleFonts.lato(
                                    fontSize: 15, color: Colors.green),
                              ),
                              Obx(() => Text(
                                  "${String.fromCharCodes(Runes('\u0024'))}${cartController.totalrevenue}",
                                  style: GoogleFonts.lato(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)))
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                          child: Icon(
                        Icons.monetization_on,
                        color: Colors.grey,
                        size: 25,
                      ))
                    ],
                  )),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height_150,
              width: width_300,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "TOTAL VENDERS",
                                style: GoogleFonts.lato(
                                    fontSize: 15, color: Colors.greenAccent),
                              ),
                              Obx(() => Text(
                                  cartController.totalvenders.toString(),
                                  style: GoogleFonts.lato(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)))
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                          child: Icon(
                        Icons.list,
                        color: Colors.grey,
                        size: 25,
                      ))
                    ],
                  )),
            ),
          ],
        ),
        SizedBox(
          height: height_50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: height_400,
              width: width_300,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const LineChartWidget()),
            ),
            SizedBox(
              height: height_30,
            ),
            SizedBox(
              height: height_400,
              width: width_300,
              child: const WeekChart(),
            ),
          ],
        ),
        SizedBox(
          height: height_50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: height_400,
              width: width_300,
              child: const MonthChart(),
            ),
            SizedBox(
              height: height_30,
            ),
            SizedBox(
              height: height_400,
              width: width_300,
              child: const YearChart(),
            ),
          ],
        ),
      ],
    );
  }
}
