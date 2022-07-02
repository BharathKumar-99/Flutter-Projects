import 'package:admin_panel/Api/venderstatuschange.dart';
import 'package:get/get.dart';

import '../Model/vender_model.dart';

class VendersController extends GetxController {
  var kycpending = <VenderModel>[].obs;

  @override
  void onInit() {
    _loaddata();
    super.onInit();
  }

  _loaddata() async {
    await VenderStatus.pendingvender().then((value) {
      kycpending.addAll(value);
      print(kycpending[1].name);
    });
  }
}
