import 'package:admin_panel/Api/complaintsapi.dart';
import 'package:get/get.dart';

import '../Model/complaintsmodel.dart';

class ComplaintController extends GetxController {
  var complaintslist = <ComplaintsModel>[].obs;

  loaddata() async {
    await ComplaintsApi.getcomplaints().then((value) {
      complaintslist.addAll(value);
    });
  }

  @override
  void onInit() {
    loaddata();
    super.onInit();
  }
}
