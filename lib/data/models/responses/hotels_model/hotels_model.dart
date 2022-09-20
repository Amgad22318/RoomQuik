import 'dart:convert';

import '../../base/status/status.dart';

Hotels hotelsFromJson(String str) => Hotels.fromJson(json.decode(str));
String hotelsToJson(Hotels data) => json.encode(data.toJson());

class Hotels {
  Hotels({
    Status? status,
    Data? data,
  }) {
    _status = status;
    _data = data;
  }

  Hotels.fromJson(dynamic json) {
    _status = json['status'] != null ? Status.fromJson(json['status']) : null;
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Status? _status;
  Data? _data;
  Hotels copyWith({
    Status? status,
    Data? data,
  }) =>
      Hotels(
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
    num? currentPage,
    List<HotelData>? data,
    String? firstPageUrl,
    num? from,
    num? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    dynamic nextPageUrl,
    String? path,
    String? perPage,
    dynamic prevPageUrl,
    num? to,
    num? total,
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
        _data?.add(HotelData.fromJson(v));
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
  num? _currentPage;
  List<HotelData>? _data;
  String? _firstPageUrl;
  num? _from;
  num? _lastPage;
  String? _lastPageUrl;
  List<Links>? _links;
  dynamic _nextPageUrl;
  String? _path;
  String? _perPage;
  dynamic _prevPageUrl;
  num? _to;
  num? _total;
  Data copyWith({
    num? currentPage,
    List<HotelData>? data,
    String? firstPageUrl,
    num? from,
    num? lastPage,
    String? lastPageUrl,
    List<Links>? links,
    dynamic nextPageUrl,
    String? path,
    String? perPage,
    dynamic prevPageUrl,
    num? to,
    num? total,
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
  num get currentPage => _currentPage ?? 0;
  List<HotelData> get data => _data ?? [];
  String get firstPageUrl => _firstPageUrl ?? "";
  num get from => _from ?? 0;
  num get lastPage => _lastPage ?? 0;
  String get lastPageUrl => _lastPageUrl ?? "";
  List<Links> get links => _links ?? [];
  dynamic get nextPageUrl => _nextPageUrl;
  String get path => _path ?? "";
  String get perPage => _perPage ?? "";
  dynamic get prevPageUrl => _prevPageUrl;
  num get to => _to ?? 0;
  num get total => _total ?? 0;

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

Links linksFromJson(String str) => Links.fromJson(json.decode(str));
String linksToJson(Links data) => json.encode(data.toJson());

class Links {
  Links({
    dynamic url,
    String? label,
    bool? active,
  }) {
    _url = url;
    _label = label;
    _active = active;
  }

  Links.fromJson(dynamic json) {
    _url = json['url'];
    _label = json['label'];
    _active = json['active'];
  }
  dynamic _url;
  String? _label;
  bool? _active;
  Links copyWith({
    dynamic url,
    String? label,
    bool? active,
  }) =>
      Links(
        url: url ?? _url,
        label: label ?? _label,
        active: active ?? _active,
      );
  dynamic get url => _url;
  String get label => _label ?? "";
  bool get active => _active ?? false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['label'] = _label;
    map['active'] = _active;
    return map;
  }
}

HotelData dataFromJson1(String str) => HotelData.fromJson(json.decode(str));
String dataToJson1(Data data) => json.encode(data.toJson());

class HotelData {
  HotelData({
    num? id,
    String? name,
    String? description,
    String? price,
    String? address,
    String? longitude,
    String? latitude,
    String? rate,
    String? createdAt,
    String? updatedAt,
    List<HotelImages>? hotelImages,
    List<HotelFacilities>? hotelFacilities,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _address = address;
    _longitude = longitude;
    _latitude = latitude;
    _rate = rate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _hotelImages = hotelImages;
    _hotelFacilities = hotelFacilities;
  }

  HotelData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _address = json['address'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _rate = json['rate'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['hotel_images'] != null) {
      _hotelImages = [];
      json['hotel_images'].forEach((v) {
        _hotelImages?.add(HotelImages.fromJson(v));
      });
    }
    if (json['hotel_facilities'] != null) {
      _hotelFacilities = [];
      json['hotel_facilities'].forEach((v) {
        _hotelFacilities?.add(HotelFacilities.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _description;
  String? _price;
  String? _address;
  String? _longitude;
  String? _latitude;
  String? _rate;
  String? _createdAt;
  String? _updatedAt;
  List<HotelImages>? _hotelImages;
  List<HotelFacilities>? _hotelFacilities;
  HotelData copyWith({
    num? id,
    String? name,
    String? description,
    String? price,
    String? address,
    String? longitude,
    String? latitude,
    String? rate,
    String? createdAt,
    String? updatedAt,
    List<HotelImages>? hotelImages,
    List<HotelFacilities>? hotelFacilities,
  }) =>
      HotelData(
        id: id ?? _id,
        name: name ?? _name,
        description: description ?? _description,
        price: price ?? _price,
        address: address ?? _address,
        longitude: longitude ?? _longitude,
        latitude: latitude ?? _latitude,
        rate: rate ?? _rate,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        hotelImages: hotelImages ?? _hotelImages,
        hotelFacilities: hotelFacilities ?? _hotelFacilities,
      );
  num get id => _id ?? 0;
  String get name => _name ?? "";
  String get description => _description ?? "";
  String get price => _price ?? "";
  String get address => _address ?? "";
  String get longitude => _longitude ?? "";
  String get latitude => _latitude ?? "";
  String get rate => _rate ?? "";
  String get createdAt => _createdAt ?? "";
  String get updatedAt => _updatedAt ?? "";
  List<HotelImages>? get hotelImages => _hotelImages;
  List<HotelFacilities>? get hotelFacilities => _hotelFacilities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['address'] = _address;
    map['longitude'] = _longitude;
    map['latitude'] = _latitude;
    map['rate'] = _rate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_hotelImages != null) {
      map['hotel_images'] = _hotelImages?.map((v) => v.toJson()).toList();
    }
    if (_hotelFacilities != null) {
      map['hotel_facilities'] =
          _hotelFacilities?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

HotelFacilities hotelFacilitiesFromJson(String str) =>
    HotelFacilities.fromJson(json.decode(str));
String hotelFacilitiesToJson(HotelFacilities data) =>
    json.encode(data.toJson());

class HotelFacilities {
  HotelFacilities({
    num? id,
    String? hotelId,
    String? facilityId,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    _id = id;
    _hotelId = hotelId;
    _facilityId = facilityId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  HotelFacilities.fromJson(dynamic json) {
    _id = json['id'];
    _hotelId = json['hotel_id'];
    _facilityId = json['facility_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _hotelId;
  String? _facilityId;
  dynamic _createdAt;
  dynamic _updatedAt;
  HotelFacilities copyWith({
    num? id,
    String? hotelId,
    String? facilityId,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      HotelFacilities(
        id: id ?? _id,
        hotelId: hotelId ?? _hotelId,
        facilityId: facilityId ?? _facilityId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num get id => _id ?? 0;
  String get hotelId => _hotelId ?? "";
  String get facilityId => _facilityId ?? "";
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['hotel_id'] = _hotelId;
    map['facility_id'] = _facilityId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}

HotelImages hotelImagesFromJson(String str) =>
    HotelImages.fromJson(json.decode(str));
String hotelImagesToJson(HotelImages data) => json.encode(data.toJson());

class HotelImages {
  HotelImages({
    num? id,
    String? hotelId,
    String? image,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    _id = id;
    _hotelId = hotelId;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  HotelImages.fromJson(dynamic json) {
    _id = json['id'];
    _hotelId = json['hotel_id'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _hotelId;
  String? _image;
  dynamic _createdAt;
  dynamic _updatedAt;
  HotelImages copyWith({
    num? id,
    String? hotelId,
    String? image,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      HotelImages(
        id: id ?? _id,
        hotelId: hotelId ?? _hotelId,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );
  num get id => _id ?? 0;
  String get hotelId => _hotelId ?? "";
  String get image => _image ?? "";
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['hotel_id'] = _hotelId;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
