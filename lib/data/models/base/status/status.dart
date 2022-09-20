import 'dart:convert';

Status statusFromJson(String str) => Status.fromJson(json.decode(str));
String statusToJson(Status data) => json.encode(data.toJson());

class Status {
  Status({
    String? type,
    Title? title,
  }) {
    _type = type;
    _title = title;
  }

  Status.fromJson(dynamic json) {
    _type = json['type'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }
  String? _type;
  Title? _title;
  Status copyWith({
    String? type,
    Title? title,
  }) =>
      Status(
        type: type ?? _type,
        title: title ?? _title,
      );
  String get type => _type ?? '0';
  Title get title => _title ?? Title();
  bool get success => _type == '1';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    if (_title != null) {
      map['title'] = _title?.toJson();
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
  String get ar => _ar ?? '';
  String get en => _en ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ar'] = _ar;
    map['en'] = _en;
    return map;
  }
}
