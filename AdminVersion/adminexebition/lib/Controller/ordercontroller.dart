import 'package:get/get.dart';

import '../Model/VenderModel.dart';
import '../Model/response.dart';
import '../Screens/Auth/AutoLogin.dart';
import '../Services/Productapi.dart';

class OrderVender extends GetxController {
  var vendermodel = <Sold>[].obs;
  var user = ResponseModel();

  _loaddata() async {
    clear();

    await ProductApi.getvenderorders(user.email!).then((orders) => {
          vendermodel.addAll(orders),
          update(),
        });
  }

  _loaduser() async {
    user = await Autologin.getLogin().then((value) => _loaddata());
  }

  clear() {
    vendermodel.clear();
  }
}
