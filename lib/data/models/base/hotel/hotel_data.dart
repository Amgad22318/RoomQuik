import 'dart:convert';

HotelData hotelDataFromJson(String str) => HotelData.fromJson(json.decode(str));
String hotelDataToJson(HotelData data) => json.encode(data.toJson());

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
  List<HotelImages> get hotelImages => _hotelImages ?? [];
  List<HotelFacilities> get hotelFacilities => _hotelFacilities ?? [];

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
    String? name,
    String? image,
    dynamic createdAt,
    dynamic updatedAt,
  }) {
    _id = id;
    _hotelId = hotelId;
    _facilityId = facilityId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _name = name;
    _image = image;
  }

  HotelFacilities.fromJson(dynamic json) {
    _id = json['id'];
    _hotelId = json['hotel_id'];
    _facilityId = json['facility_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _name = json['name'];
    _image = json['image'];
  }
  num? _id;
  String? _hotelId;
  String? _facilityId;
  String? _name;
  String? _image;
  dynamic _createdAt;
  dynamic _updatedAt;
  HotelFacilities copyWith({
    num? id,
    String? hotelId,
    String? facilityId,
    String? name,
    String? image,
    dynamic createdAt,
    dynamic updatedAt,
  }) =>
      HotelFacilities(
        id: id ?? _id,
        hotelId: hotelId ?? _hotelId,
        facilityId: facilityId ?? _facilityId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        name: name ?? _name,
        image: image ?? _image,
      );
  num get id => _id ?? 0;
  String get hotelId => _hotelId ?? "";
  String get facilityId => _facilityId ?? "";
  String get name => _name ?? '';
  String get image => _image ?? '';
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['hotel_id'] = _hotelId;
    map['facility_id'] = _facilityId;
    map['name'] = _name;
    map['image'] = _image;
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
