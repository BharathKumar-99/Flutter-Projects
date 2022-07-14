class CustomerListModel {
  String? sId;
  String? name;
  String? email;
  String? phone;
  List<Purchased>? purchased;

  CustomerListModel(
      {this.sId, this.name, this.email, this.phone, this.purchased});

  CustomerListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    if (json['purchased'] != null) {
      purchased = <Purchased>[];
      json['purchased'].forEach((v) {
        purchased!.add(Purchased.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    if (purchased != null) {
      data['purchased'] = purchased!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Purchased {
  String? orderid;
  String? soldby;
  String? date;
  List<Products>? products;

  Purchased({this.orderid, this.soldby, this.date, this.products});

  Purchased.fromJson(Map<String, dynamic> json) {
    orderid = json['orderid'];
    soldby = json['soldby'];
    date = json['date'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderid'] = orderid;
    data['soldby'] = soldby;
    data['date'] = date;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? nId;
  String? name;
  int? barcode;
  String? pic;
  int? price;
  String? description;
  int? quantity;

  Products(
      {this.nId,
      this.name,
      this.barcode,
      this.pic,
      this.price,
      this.description,
      this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    nId = json['_id'];
    name = json['Name'];
    barcode = json['Barcode'];
    pic = json['Pic'];
    price = json['Price'];
    description = json['Description'];
    quantity = json['Quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = nId;
    data['Name'] = name;
    data['Barcode'] = barcode;
    data['Pic'] = pic;
    data['Price'] = price;
    data['Description'] = description;
    data['Quantity'] = quantity;
    return data;
  }
}
