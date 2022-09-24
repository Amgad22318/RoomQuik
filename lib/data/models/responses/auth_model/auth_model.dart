import 'dart:convert';

import '../../base/status/status.dart';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));
String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  Auth({
    Status? status,
    Data? data,
  }) {
    _status = status;
    _data = data;
  }

  Auth.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Status? _status;
  Data? _data;
  Auth copyWith({
    Status? status,
    Data? data,
  }) =>
      Auth(
        status: status ?? _status,
        data: data ?? _data,
      );
  Status get status => _status ?? Status();
  Data get data => _data ?? Data();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
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

  Data.fromJson(dynamic json) {
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
  Data copyWith({
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
      Data(
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
