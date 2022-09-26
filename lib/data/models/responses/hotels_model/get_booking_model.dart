import 'dart:convert';

import '../../base/hotel/hotel_data.dart';
import '../../base/links/links.dart';
import '../../base/status/status.dart';
import '../../base/user_data/user_data.dart';

GetBookingModel getBookingModelFromJson(String str) =>
    GetBookingModel.fromJson(json.decode(str));
String getBookingModelToJson(GetBookingModel data) =>
    json.encode(data.toJson());

class GetBookingModel {
  GetBookingModel({
    Status? status,
    Data? data,
  }) {
    _status = status;
    _data = data;
  }

  GetBookingModel.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Status? _status;
  Data? _data;
  GetBookingModel copyWith({
    Status? status,
    Data? data,
  }) =>
      GetBookingModel(
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
    int? currentPage,
    List<BookingData>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    String? nextPageUrl,
    String? path,
    String? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  }) {
    _currentPage = currentPage;
    _data = data;
    _firstPageUrl = firstPageUrl;
    _from = from;
    _lastPage = lastPage;
    _lastPageUrl = lastPageUrl;
    _links = links;
    _nextPageUrl = nextPageUrl;
    _path = path;
    _perPage = perPage;
    _prevPageUrl = prevPageUrl;
    _to = to;
    _total = total;
  }

  Data.fromJson(dynamic json) {
    _currentPage = json['current_page'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BookingData.fromJson(v));
      });
    }
    _firstPageUrl = json['first_page_url'];
    _from = json['from'];
    _lastPage = json['last_page'];
    _lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
    _nextPageUrl = json['next_page_url'];
    _path = json['path'];
    _perPage = json['per_page'];
    _prevPageUrl = json['prev_page_url'];
    _to = json['to'];
    _total = json['total'];
  }
  int? _currentPage;
  List<BookingData>? _data;
  String? _firstPageUrl;
  int? _from;
  int? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  String? _nextPageUrl;
  String? _path;
  String? _perPage;
  String? _prevPageUrl;
  int? _to;
  int? _total;
  Data copyWith({
    int? currentPage,
    List<BookingData>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    String? nextPageUrl,
    String? path,
    String? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  }) =>
      Data(
        currentPage: currentPage ?? _currentPage,
        data: data ?? _data,
        firstPageUrl: firstPageUrl ?? _firstPageUrl,
        from: from ?? _from,
        lastPage: lastPage ?? _lastPage,
        lastPageUrl: lastPageUrl ?? _lastPageUrl,
        links: links ?? _links,
        nextPageUrl: nextPageUrl ?? _nextPageUrl,
        path: path ?? _path,
        perPage: perPage ?? _perPage,
        prevPageUrl: prevPageUrl ?? _prevPageUrl,
        to: to ?? _to,
        total: total ?? _total,
      );
  int get currentPage => _currentPage ?? 0;
  List<BookingData> get data => _data ?? [];
  String get firstPageUrl => _firstPageUrl ?? "";
  int get from => _from ?? 0;
  int get lastPage => _lastPage ?? 0;
  String get lastPageUrl => _lastPageUrl ?? "";
  List<Links> get links => _links ?? [];
  String get nextPageUrl => _nextPageUrl ?? "";
  String get path => _path ?? "";
  String get perPage => _perPage ?? "";
  String get prevPageUrl => _prevPageUrl ?? "";
  int get to => _to ?? 0;
  int get total => _total ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = _currentPage;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = _firstPageUrl;
    map['from'] = _from;
    map['last_page'] = _lastPage;
    map['last_page_url'] = _lastPageUrl;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    map['next_page_url'] = _nextPageUrl;
    map['path'] = _path;
    map['per_page'] = _perPage;
    map['prev_page_url'] = _prevPageUrl;
    map['to'] = _to;
    map['total'] = _total;
    return map;
  }
}

BookingData bookingDataFromJson(String str) =>
    BookingData.fromJson(json.decode(str));
String bookingDataToJson(BookingData data) => json.encode(data.toJson());

class BookingData {
  BookingData({
    int? id,
    String? userId,
    String? hotelId,
    String? type,
    String? createdAt,
    String? updatedAt,
    UserData? user,
    HotelData? hotel,
  }) {
    _id = id;
    _userId = userId;
    _hotelId = hotelId;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _user = user;
    _hotel = hotel;
  }

  BookingData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _hotelId = json['hotel_id'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    _hotel = json['hotel'] != null ? HotelData.fromJson(json['hotel']) : null;
  }
  int? _id;
  String? _userId;
  String? _hotelId;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
  UserData? _user;
  HotelData? _hotel;
  BookingData copyWith({
    int? id,
    String? userId,
    String? hotelId,
    String? type,
    String? createdAt,
    String? updatedAt,
    UserData? user,
    HotelData? hotel,
  }) =>
      BookingData(
        id: id ?? _id,
        userId: userId ?? _userId,
        hotelId: hotelId ?? _hotelId,
        type: type ?? _type,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        user: user ?? _user,
        hotel: hotel ?? _hotel,
      );
  int get id => _id ?? 0;
  String get userId => _userId ?? "";
  String get hotelId => _hotelId ?? "";
  String get type => _type ?? "";
  String get createdAt => _createdAt ?? "";
  String? get updatedAt => _updatedAt ?? "";
  UserData get user => _user ?? UserData();
  HotelData get hotel => _hotel ?? HotelData();

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['hotel_id'] = _hotelId;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_hotel != null) {
      map['hotel'] = _hotel?.toJson();
    }
    return map;
  }
}
