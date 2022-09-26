import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));
String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    num? id,
    String? name,
    String? email,
    String? emailVerifiedAt,
    String? apiToken,
    String? image,
    String? createdAt,
    String? updatedAt,
    String? googleId,
    dynamic provider,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _apiToken = apiToken;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _googleId = googleId;
    _provider = provider;
  }

  UserData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _apiToken = json['api_token'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _googleId = json['google_id'];
    _provider = json['provider'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _emailVerifiedAt;
  String? _apiToken;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  String? _googleId;
  dynamic _provider;
  UserData copyWith({
    num? id,
    String? name,
    String? email,
    String? emailVerifiedAt,
    String? apiToken,
    String? image,
    String? createdAt,
    String? updatedAt,
    String? googleId,
    dynamic provider,
  }) =>
      UserData(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
        apiToken: apiToken ?? _apiToken,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        googleId: googleId ?? _googleId,
        provider: provider ?? _provider,
      );
  num get id => _id ?? 0;
  String get name => _name ?? "";
  String get email => _email ?? "";
  String get emailVerifiedAt => _emailVerifiedAt ?? "";
  String get apiToken => _apiToken ?? "";
  String get image => _image ?? "";
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? "";
  String get googleId => _googleId ?? "";
  dynamic get provider => _provider;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['api_token'] = _apiToken;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['google_id'] = _googleId;
    map['provider'] = _provider;
    return map;
  }
}
