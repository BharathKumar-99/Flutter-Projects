// ignore_for_file: file_names

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:ecommerce_website/Screens/Complaints.dart';
import 'package:ecommerce_website/Screens/KycVerification.dart';
import 'package:ecommerce_website/Screens/Notificatin.dart';
import 'package:ecommerce_website/Screens/Product.dart';
import 'package:ecommerce_website/Screens/Venders.dart';
import 'package:ecommerce_website/Utils/Dimentions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: page,
            // onDisplayModeChanged: (mode) {
            //   print(mode);
            // },
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 6, 47, 170),
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: Dimentions.height150,
                    maxWidth: Dimentions.width150,
                  ),
                  child: Text(
                    "Ecommerce",
                    style: GoogleFonts.lato(fontSize: 23, color: Colors.white),
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Jr Creations',
                style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Dashboard',
                onTap: () {
                  page.jumpToPage(0);
                },
                icon: const Icon(Icons.dashboard),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Kyc Verification',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(Icons.people),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Venders',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: const Icon(Icons.people),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Product',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              SideMenuItem(
                priority: 5,
                title: 'Complaints',
                onTap: () {
                  page.jumpToPage(4);
                },
                icon: const Icon(Icons.bubble_chart),
              ),
              SideMenuItem(
                priority: 6,
                title: 'Notifications',
                onTap: () {
                  page.jumpToPage(5);
                },
                icon: const Icon(Icons.notifications),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: const [
                DashBoard(),
                KycVerification(),
                VendersPage(),
                ProductScreen(),
                ComplaintsScreen(),
                NotificationScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
