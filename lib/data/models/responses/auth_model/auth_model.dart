import 'dart:convert';

import '../../base/status/status.dart';
import '../../base/user_data/user_data.dart';

Auth authFromJson(String str) => Auth.fromJson(json.decode(str));
String authToJson(Auth data) => json.encode(data.toJson());

class Auth {
  Auth({
    Status? status,
    UserData? data,
  }) {
    _status = status;
    _data = data;
  }

  Auth.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
  Status? _status;
  UserData? _data;
  Auth copyWith({
    Status? status,
    UserData? data,
  }) =>
      Auth(
        status: status ?? _status,
        data: data ?? _data,
      );
  Status get status => _status ?? Status();
  UserData get data => _data ?? UserData();

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
