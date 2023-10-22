class ProfileModel {
  String? message;
  List<Data>? data;
  bool? status;
  int? code;

  ProfileModel({this.message, this.data, this.status, this.code});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  Data({this.id, this.name, this.email, this.phone, this.gender});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
  }
}
