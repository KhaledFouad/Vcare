class Data {
  String? token;
  String? username;

  Data({this.token, this.username});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json['token'] as String?,
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'username': username,
      };
}
