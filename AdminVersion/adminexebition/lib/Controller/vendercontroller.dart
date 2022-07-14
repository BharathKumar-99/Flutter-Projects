import 'package:get/get.dart';

import '../Model/VenderModel.dart';
import '../Services/venderapi.dart';

class VenderController extends GetxController {
  var vendercontroller = <VenderModel>[].obs;

  @override
  void onInit() {
    _loaddata();
    super.onInit();
  }

  _loaddata() async {
    await VenderApi.getactivevenders();
  }
}
