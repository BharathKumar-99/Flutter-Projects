import 'package:admin_panel/Api/productsapi.dart';
import 'package:admin_panel/Model/productmodel.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productctl = <ProductsModel>[].obs;

  _loaddata() async {
    await ProductsRest.getproducts().then((val) {
      productctl.addAll(val);
    });
  }

  @override
  void onInit() {
    _loaddata();
    super.onInit();
  }
}
