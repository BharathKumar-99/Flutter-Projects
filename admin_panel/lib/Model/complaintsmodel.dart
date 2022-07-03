class ComplaintsModel {
  String? sId;
  String? email;
  String? body;
  String? date;

  ComplaintsModel({this.sId, this.email, this.body, this.date});

  ComplaintsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    body = json['body'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['body'] = body;
    data['date'] = date;
    return data;
  }
}
