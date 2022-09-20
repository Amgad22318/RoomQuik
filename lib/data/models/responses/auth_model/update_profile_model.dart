import 'dart:convert';

import '../../base/status/status.dart';

UpdateProfileModel updateProfileModelFromJson(String str) =>
    UpdateProfileModel.fromJson(json.decode(str));
String updateProfileModelToJson(UpdateProfileModel data) =>
    json.encode(data.toJson());

class UpdateProfileModel {
  UpdateProfileModel({
    Status? status,
    Data? data,
  }) {
    _status = status;
    _data = data;
  }

  UpdateProfileModel.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Status? _status;
  Data? _data;
  UpdateProfileModel copyWith({
    Status? status,
    Data? data,
  }) =>
      UpdateProfileModel(
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
    dynamic emailVerifiedAt,
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
  dynamic _emailVerifiedAt;
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
    dynamic emailVerifiedAt,
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
  dynamic get emailVerifiedAt => _emailVerifiedAt;
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

Title titleFromJson(String str) => Title.fromJson(json.decode(str));
String titleToJson(Title data) => json.encode(data.toJson());

class Title {
  Title({
    String? ar,
    String? en,
  }) {
    _ar = ar;
    _en = en;
  }

  Title.fromJson(dynamic json) {
    _ar = json['ar'];
    _en = json['en'];
  }
  String? _ar;
  String? _en;
  Title copyWith({
    String? ar,
    String? en,
  }) =>
      Title(
        ar: ar ?? _ar,
        en: en ?? _en,
      );
  String get ar => _ar ?? "";
  String get en => _en ?? "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ar'] = _ar;
    map['en'] = _en;
    return map;
  }
}
