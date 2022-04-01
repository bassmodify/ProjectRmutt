class CartModel {
  int? id;
  String? idnumber;

  CartModel({this.id, this.idnumber});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idnumber = json['idnumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idnumber'] = this.idnumber;
    return data;
  }
}
