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
