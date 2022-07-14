import 'package:get/get.dart';

import '../Model/response.dart';
import '../Screens/Auth/AutoLogin.dart';

class UserController extends GetxController {
  var user = ResponseModel();

  @override
  void onInit() {
    _loaduser();
    super.onInit();
  }

  _loaduser() async {
    user = await Autologin.getLogin();
  }
}
