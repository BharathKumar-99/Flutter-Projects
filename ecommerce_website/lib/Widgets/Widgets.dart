import 'package:ecommerce_website/Utils/Dimentions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardAppBar extends StatelessWidget {
  const DashBoardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          child: Text(
            "Name",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

Widget drawer() {
  return SizedBox(
    width: Dimentions.width6Quarter,
    child: Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            Text(
              "Ecommerce",
              style: GoogleFonts.lato(fontSize: 25, color: Colors.white),
            ),
            SizedBox(height: Dimentions.height50),
            ListTile(
              leading: const Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
              title: Text(
                "DashBoard",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                "Customer",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text(
                "Vender",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              title: Text(
                "Products",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.chat_bubble,
                color: Colors.white,
              ),
              title: Text(
                "Complaints",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.bubble_chart,
                color: Colors.white,
              ),
              title: Text(
                "Notifications",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget venderProfileImage() {
  return const CircleAvatar(
    backgroundImage: NetworkImage('https://picsum.photos/id/237/200/300'),
  );
}
