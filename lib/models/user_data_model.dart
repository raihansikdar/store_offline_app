class UserDataModel {
  int? id;
  String? name;
  // String? username;
  // String? email;
  // Address? address;

  UserDataModel({this.id, this.name, /*this.username, this.email, this.address*/});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    // username = json['username'];
    // email = json['email'];
    // address =
    // json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    // data['username'] = username;
    // data['email'] = email;
    // if (address != null) {
    //   data['address'] = address!.toJson();
    // }
    return data;
  }
}

class Address {
  String? street;
  String? city;
  String? state;
  String? zipcode;

  Address({this.street, this.city, this.state, this.zipcode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['city'] = city;
    data['state'] = state;
    data['zipcode'] = zipcode;
    return data;
  }
}
