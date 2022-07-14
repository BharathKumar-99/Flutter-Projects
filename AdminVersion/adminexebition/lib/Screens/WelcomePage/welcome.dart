import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/response.dart';
import '../Auth/AutoLogin.dart';
import '../Auth/Login.dart';
import '../Home/MainScreen.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  ResponseModel user = ResponseModel();

  @override
  void initState() {
    super.initState();
    _getCred();
  }

  _getCred() async {
    user = await Autologin.getLogin();

    if (user.email != null) {
      setState(() {
        Get.off(() => const Home());
      });
    } else {
      setState(() {
        Get.off(() => const Login());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Image.asset("assets/welcome.png"),
      ),
    ));
  }
}
