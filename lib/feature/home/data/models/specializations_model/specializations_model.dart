import 'data.dart';

class SpecializationsModel {
  String? message;
  List<Data>? data;
  bool? status;
  int? code;

  SpecializationsModel({this.message, this.data, this.status, this.code});

  factory SpecializationsModel.fromJson(Map<String, dynamic> json) =>
      SpecializationsModel(
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as bool?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
        'status': status,
        'code': code,
      };
}
