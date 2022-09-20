import 'dart:convert';

import 'package:algoriza_team_6_realestate_app/data/models/base/status/status.dart';

Facilities facilitiesFromJson(String str) =>
    Facilities.fromJson(json.decode(str));
String facilitiesToJson(Facilities data) => json.encode(data.toJson());

class Facilities {
  Facilities({
    Status? status,
    List<Data>? data,
  }) {
    _status = status;
    _data = data;
  }

  Facilities.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  Status? _status;
  List<Data>? _data;
  Facilities copyWith({
    Status? status,
    List<Data>? data,
  }) =>
      Facilities(
        status: status ?? _status,
        data: data ?? _data,
      );

  Status get status => _status ?? Status();
  List<Data> get data => _data ?? [];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    int? id,
    String? name,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  int? _id;
  String? _name;
  String? _image;
  String? _createdAt;
  String? _updatedAt;
  Data copyWith({
    int? id,
    String? name,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  int get id => _id ?? 0;
  String get name => _name ?? '';
  String get image => _image ?? '';
  String get createdAt => _createdAt ?? '';
  String get updatedAt => _updatedAt ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
