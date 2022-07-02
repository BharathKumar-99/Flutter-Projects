import 'package:ecommerce_website/Model/VendersModel.dart';
import 'package:ecommerce_website/Requests/Api/DashApi.dart';
import 'package:get/get.dart';

import '../Model/Dashboard.dart';

class DashBoardController extends GetxController {
  var dashboardctl = <DashboardModel>[].obs;
  var venderctl = <VenderModel>[].obs;
  int get totalsolditem => _totalsold();
  int get totalrevenue => _totalrevenue();
  int get totalvenders => _totalvender();

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

  _loaddata() async {
    await Api.getdashboardapi().then((value) {
      dashboardctl.addAll(value);
    });
    await Api.getdashboardvender().then((value) {
      venderctl.addAll(value);
    });
  }
}
