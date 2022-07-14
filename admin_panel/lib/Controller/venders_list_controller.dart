import 'package:admin_panel/Api/venderstatuschange.dart';
import 'package:get/get.dart';

import '../Model/vender_model.dart';

class VendersController extends GetxController {
  var kycpending = <VenderModel>[].obs;
  var approvedvender = <VenderModel>[].obs;

  @override
  void onInit() {
    loaddata();
    super.onInit();
  }

  loaddata() async {
    clear();
    await VenderStatus.pendingvender().then((value) {
      kycpending.addAll(value);
    });

    await VenderStatus.approvedvender().then((value) {
      approvedvender.addAll(value);
    });
  }

  relaod() async {
    clear();
    await VenderStatus.pendingvender().then((value) {
      kycpending.addAll(value);
    });
    await VenderStatus.approvedvender().then((value) {
      approvedvender.addAll(value);
    });
    update();
  }

  clear() {
    kycpending.clear();
    approvedvender.clear();
  }
}
