import 'city.dart';
import 'specialization.dart';

class Doctor {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  Specialization? specialization;
  City? city;
  int? appointPrice;
  String? startTime;
  String? endTime;

  Doctor({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        photo: json['photo'] as String?,
        gender: json['gender'] as String?,
        address: json['address'] as String?,
        description: json['description'] as String?,
        degree: json['degree'] as String?,
        specialization: json['specialization'] == null
            ? null
            : Specialization.fromJson(
                json['specialization'] as Map<String, dynamic>),
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
        appointPrice: json['appoint_price'] as int?,
        startTime: json['start_time'] as String?,
        endTime: json['end_time'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'photo': photo,
        'gender': gender,
        'address': address,
        'description': description,
        'degree': degree,
        'specialization': specialization?.toJson(),
        'city': city?.toJson(),
        'appoint_price': appointPrice,
        'start_time': startTime,
        'end_time': endTime,
      };
}
