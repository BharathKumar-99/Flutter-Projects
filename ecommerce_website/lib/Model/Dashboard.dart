class DashboardModel {
  String? sId;
  String? name;
  int? quantity;
  int? barcode;
  String? pic;
  int? price;

  DashboardModel(
      {this.sId, this.name, this.quantity, this.barcode, this.pic, this.price});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    quantity = json['quantity'];
    barcode = json['barcode'];
    pic = json['pic'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['quantity'] = quantity;
    data['barcode'] = barcode;
    data['pic'] = pic;
    data['price'] = price;
    return data;
  }
}
