import 'package:admin_panel/Controller/customercontrller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerInfo extends StatefulWidget {
  int index;
  CustomerInfo(this.index, {Key? key}) : super(key: key);

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  final c = Get.put(CustmerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Card(
              color: Colors.blueAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Customer Name :${c.customerctl[widget.index].name!}",
                            style: GoogleFonts.lato(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text(
                            "Email Address :${c.customerctl[widget.index].email!}",
                            style: GoogleFonts.lato(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text(
                            "Phone Number :${c.customerctl[widget.index].phone!}",
                            style: GoogleFonts.lato(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Text(
          "Orders",
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Expanded(
          flex: 2,
          child: Card(
            color: Colors.white30,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: c.customerctl[widget.index].purchased!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        elevation: 10,
                        color: Colors.blueAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Order id:${c.customerctl[widget.index].purchased![index].orderid!}",
                                    style: GoogleFonts.lato(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Text(
                                    "Bought on:${c.customerctl[widget.index].purchased![index].date!}",
                                    style: GoogleFonts.lato(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Order id:${c.customerctl[widget.index].purchased![index].soldby!}",
                                  style: GoogleFonts.lato(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: productrow(index)),
                              )
                            ],
                          ),
                        ));
                  }),
            ),
          ),
        ),
      ],
    ));
  }

  Widget productrow(int indexs) {
    int index = indexs;
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount:
            c.customerctl[widget.index].purchased![index].products!.length,
        itemBuilder: (BuildContext context, int ind) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(c.customerctl[widget.index]
                      .purchased![index].products![ind].pic!),
                ),
                Text(
                  c.customerctl[widget.index].purchased![index].products![ind]
                      .name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Text(
                  "X ${c.customerctl[widget.index].purchased![index].products![ind].quantity}",
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ));
        });
  }
}
