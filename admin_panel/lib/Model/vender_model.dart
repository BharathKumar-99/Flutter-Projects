class VenderModel {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? panFront;
  String? panBack;
  String? aadharFront;
  String? aadharBack;
  String? status;
  int? productin;
  int? productout;
  List<Products>? products;
  List<Products>? sold;

  VenderModel({
    this.sId,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.panFront,
    this.panBack,
    this.aadharFront,
    this.aadharBack,
    this.status,
    this.productin,
    this.productout,
    this.products,
    this.sold,
  });

  VenderModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    panFront = json['pan_front'];
    panBack = json['pan_back'];
    aadharFront = json['aadhar_front'];
    aadharBack = json['aadhar_back'];
    status = json['status'];
    productin = json['productin'];
    productout = json['productout'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['sold'] != null) {
      sold = <Products>[];
      json['sold'].forEach((v) {
        sold!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['pan_front'] = panFront;
    data['pan_back'] = panBack;
    data['aadhar_front'] = aadharFront;
    data['aadhar_back'] = aadharBack;
    data['status'] = status;
    data['productin'] = productin;
    data['productout'] = productout;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (sold != null) {
      data['sold'] = sold!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Products {
  String? name;
  int? barcode;
  int? quantity;

  Products({this.name, this.barcode, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    barcode = json['Barcode'];
    quantity = json['Quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Barcode'] = barcode;
    data['Quantity'] = quantity;
    return data;
  }
}
