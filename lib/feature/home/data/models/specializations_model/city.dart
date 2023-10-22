import 'governrate.dart';

class City {
  int? id;
  String? name;
  Governrate? governrate;

  City({this.id, this.name, this.governrate});

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'] as int?,
        name: json['name'] as String?,
        governrate: json['governrate'] == null
            ? null
            : Governrate.fromJson(json['governrate'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'governrate': governrate?.toJson(),
      };
}
