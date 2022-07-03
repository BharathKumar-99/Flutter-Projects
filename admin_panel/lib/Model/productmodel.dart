class ProductsModel {
  String? sId;
  String? name;
  int? barcode;
  String? pic;
  int? price;
  String? description;
  int? quantity;

  ProductsModel(
      {this.sId,
      this.name,
      this.barcode,
      this.pic,
      this.price,
      this.description,
      this.quantity});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    barcode = json['Barcode'];
    pic = json['Pic'];
    price = json['Price'];
    description = json['Description'];
    quantity = json['Quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['Name'] = name;
    data['Barcode'] = barcode;
    data['Pic'] = pic;
    data['Price'] = price;
    data['Description'] = description;
    data['Quantity'] = quantity;
    return data;
  }
}
