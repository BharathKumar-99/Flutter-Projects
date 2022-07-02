// ignore_for_file: unused_local_variable

import 'package:get/get.dart';

import '../Api/dashboard_api.dart';
import '../Model/dashboard_model.dart';
import '../Model/vender_model.dart';

class DashBoardController extends GetxController {
  var dashboardctl = <DashboardModel>[].obs;
  var venderctl = <VenderModel>[].obs;
  var kycpending = <VenderModel>[].obs;
  int get totalsolditem => _totalsold();
  int get totalrevenue => _totalrevenue();
  int get totalvenders => _totalvender();

  @override
  void onInit() {
    _loaddata();
    super.onInit();
  }

  int _totalsold() {
    int totalsolditem = 0;
    for (var item in dashboardctl) {
      {
        totalsolditem++;
      }
    }
    return totalsolditem;
  }

  int _totalrevenue() {
    int totalrevenue = 0;
    for (var item in dashboardctl) {
      {
        if (item.price != null && item.quantity != null) {
          totalrevenue += (item.price! * item.quantity!);
        }
      }
    }
    return totalrevenue;
  }

  int _totalvender() {
    int totalvender = 0;
    for (var item in venderctl) {
      {
        totalvender++;
      }
    }

    return totalvender;
  }

  _kycvenders() async {
    for (var item in venderctl) {
      kycpending.addIf(item.status == "pending", item);
    }
  }

  _loaddata() async {
    await Api.getdashboardapi().then((value) {
      dashboardctl.addAll(value);
    });
    await Api.getdashboardvender().then((value) {
      venderctl.addAll(value);
      _kycvenders();
    });
  }
}
