import 'dart:convert';

import '../../base/status/status.dart';

UpdateCreateBookingModel updateCreateBookingModelFromJson(String str) =>
    UpdateCreateBookingModel.fromJson(json.decode(str));
String updateCreateBookingModelToJson(UpdateCreateBookingModel data) =>
    json.encode(data.toJson());

class UpdateCreateBookingModel {
  UpdateCreateBookingModel({
    Status? status,
  }) {
    _status = status;
  }

  UpdateCreateBookingModel.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  Status? _status;
  UpdateCreateBookingModel copyWith({
    Status? status,
  }) =>
      UpdateCreateBookingModel(
        status: status ?? _status,
      );
  Status get status => _status ?? Status();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_status != null) {
      map['status'] = _status?.toJson();
    }
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
