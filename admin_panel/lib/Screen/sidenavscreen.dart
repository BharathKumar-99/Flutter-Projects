import 'package:admin_panel/Screen/ProductScreen.dart';
import 'package:admin_panel/Screen/venderaproved.dart';
import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:google_fonts/google_fonts.dart';

import 'complaintspage.dart';
import 'createproductscreen.dart';
import 'dash_board.dart';
import 'kyc_verification.dart';

class SideNavScreen extends StatefulWidget {
  const SideNavScreen({Key? key}) : super(key: key);

  @override
  State<SideNavScreen> createState() => _SideNavScreenState();
}

class _SideNavScreenState extends State<SideNavScreen> {
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

              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
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
                priority: 1,
                title: 'KycVerification',
                onTap: () {
                  page.jumpToPage(1);
                },
                icon: const Icon(Icons.supervisor_account),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Venders',
                onTap: () {
                  page.jumpToPage(2);
                },
                icon: const Icon(Icons.person),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Product',
                onTap: () {
                  page.jumpToPage(3);
                },
                icon: const Icon(Icons.shopping_bag_rounded),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Complaints',
                onTap: () {
                  page.jumpToPage(4);
                },
                icon: const Icon(Icons.pages_rounded),
              ),
              SideMenuItem(
                priority: 5,
                title: 'Notification',
                onTap: () {
                  page.jumpToPage(5);
                },
                icon: const Icon(Icons.notifications),
              ),
              SideMenuItem(
                priority: 6,
                title: 'Create Product',
                onTap: () {
                  page.jumpToPage(6);
                },
                icon: const Icon(Icons.shopping_bag_rounded),
              ),
              SideMenuItem(
                priority: 7,
                title: 'Logout',
                onTap: () async {},
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                const Dashboard(),
                const KycVerification(),
                const VenderApprovedList(),
                const ProductPage(),
                const ComplaintsScreen(),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'No New Notifications',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                const CreateProductScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
