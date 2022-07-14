import 'package:admin_panel/Api/productsapi.dart';
import 'package:admin_panel/Model/productmodel.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productctl = <ProductsModel>[].obs;

  loaddata() async {
    clear();
    await ProductsRest.getproducts().then((val) {
      productctl.addAll(val);
    });
  }

  @override
  void onInit() {
    loaddata();
    super.onInit();
  }

  clear() {
    productctl.clear();
  }

  relaod() {
    clear();
    loaddata();
  }
}
