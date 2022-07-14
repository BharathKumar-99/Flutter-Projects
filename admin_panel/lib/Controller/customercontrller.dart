import 'package:admin_panel/Api/custmerapi.dart';
import 'package:get/state_manager.dart';

import '../Model/customerlistmodel.dart';

class CustmerController extends GetxController {
  var customerctl = <CustomerListModel>[].obs;

  @override
  void onInit() {
    loaddata();
    super.onInit();
  }

  loaddata() async {
    clear();
    await CustoemrApi.getcustmer().then((value) {
      customerctl.addAll(value);
    });
  }

  clear() {
    customerctl.clear();
  }

  relaod() async {
    clear();
    await CustoemrApi.getcustmer().then((value) {
      customerctl.addAll(value);
    });
    update();
  }
}
