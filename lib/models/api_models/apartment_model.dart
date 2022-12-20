// To parse this JSON data, do
//
//     final addressApartmentModel = addressApartmentModelFromJson(jsonString);

import 'dart:convert';

AddressApartmentModel addressApartmentModelFromJson(String str) => AddressApartmentModel.fromJson(json.decode(str));

String addressApartmentModelToJson(AddressApartmentModel data) => json.encode(data.toJson());

class AddressApartmentModel {
  AddressApartmentModel({
    this.data,
    this.success,
  });

  List<Datum>? data;
  bool? success;

  factory AddressApartmentModel.fromJson(Map<String, dynamic> json) => AddressApartmentModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
  };
}

class Datum {
  Datum({
    this.id,
    this.apartmentUuid,
    this.addressId,
    this.buildingId,
    this.apartmentNo,
    this.floor,
    this.accountNumber,
    this.korpus,
    this.blok,
    this.podyez,
    this.townId,
    this.cityId,
    this.departmentId,
    this.registerPersonCount,
    this.phoneNumber,
    this.apartmentDetail,
    this.person,
    this.apartmentOwnerType,
  });

  int? id;
  String? apartmentUuid;
  int? addressId;
  int? buildingId;
  String? apartmentNo;
  int? floor;
  int? accountNumber;
  Blok? korpus;
  Blok? blok;
  String? podyez;
  int? townId;
  int? cityId;
  int? departmentId;
  int? registerPersonCount;
  String? phoneNumber;
  ApartmentDetail? apartmentDetail;
  List<Person>? person;
  List<ApartmentOwnerType>? apartmentOwnerType;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    apartmentUuid: json["apartment_uuid"],
    addressId: json["address_id"],
    buildingId: json["building_id"],
    apartmentNo: json["apartment_no"],
    floor: json["floor"],
    accountNumber: json["account_number"],
    korpus: blokValues.map![json["korpus"]],
    blok: blokValues.map![json["blok"]],
    podyez: json["podyez"],
    townId: json["town_id"],
    cityId: json["city_id"],
    departmentId: json["department_id"],
    registerPersonCount: json["register_person_count"],
    phoneNumber: json["phone_number"],
    apartmentDetail: ApartmentDetail.fromJson(json["apartment_detail"]),
    person: List<Person>.from(json["person"].map((x) => Person.fromJson(x))),
    apartmentOwnerType: List<ApartmentOwnerType>.from(json["apartment_owner_type"].map((x) => ApartmentOwnerType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "apartment_uuid": apartmentUuid,
    "address_id": addressId,
    "building_id": buildingId,
    "apartment_no": apartmentNo,
    "floor": floor,
    "account_number": accountNumber,
    "korpus": blokValues.reverse[korpus],
    "blok": blokValues.reverse[blok],
    "podyez": podyez,
    "town_id": townId,
    "city_id": cityId,
    "department_id": departmentId,
    "register_person_count": registerPersonCount,
    "phone_number": phoneNumber,
    "apartment_detail": apartmentDetail?.toJson(),
    "person": List<dynamic>.from(person!.map((x) => x.toJson())),
    "apartment_owner_type": List<dynamic>.from(apartmentOwnerType!.map((x) => x.toJson())),
  };
}

class ApartmentDetail {
  ApartmentDetail({
    this.apartmentId,
    this.liveArea,
    this.apartmentComplateArea,
  });

  int? apartmentId;
  double? liveArea;
  String? apartmentComplateArea;

  factory ApartmentDetail.fromJson(Map<String, dynamic> json) => ApartmentDetail(
    apartmentId: json["apartment_id"],
    liveArea: json["live_area"].toDouble(),
    apartmentComplateArea: json["apartment_complate_area"],
  );

  Map<String, dynamic> toJson() => {
    "apartment_id": apartmentId,
    "live_area": liveArea,
    "apartment_complate_area": apartmentComplateArea,
  };
}

class ApartmentOwnerType {
  ApartmentOwnerType({
    this.apartmentId,
    this.ownerTypeId,
  });

  int? apartmentId;
  int? ownerTypeId;

  factory ApartmentOwnerType.fromJson(Map<String, dynamic> json) => ApartmentOwnerType(
    apartmentId: json["apartment_id"],
    ownerTypeId: json["owner_type_id"],
  );

  Map<String, dynamic> toJson() => {
    "apartment_id": apartmentId,
    "owner_type_id": ownerTypeId,
  };
}

enum Blok { EMPTY }

final blokValues = EnumValues({
  " ": Blok.EMPTY
});

class Person {
  Person({
    this.personUuid,
    this.personId,
    this.personName,
    this.personSurname,
    this.personFathername,
    this.gender,
    this.laravelThroughKey,
  });

  String? personUuid;
  int? personId;
  String? personName;
  String? personSurname;
  String? personFathername;
  Gender? gender;
  int? laravelThroughKey;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    personUuid: json["person_uuid"],
    personId: json["person_id"],
    personName: json["person_name"],
    personSurname: json["person_surname"],
    personFathername: json["person_fathername"],
    gender: genderValues.map![json["gender"]],
    laravelThroughKey: json["laravel_through_key"],
  );

  Map<String, dynamic> toJson() => {
    "person_uuid": personUuid,
    "person_id": personId,
    "person_name": personName,
    "person_surname": personSurname,
    "person_fathername": personFathername,
    "gender": genderValues.reverse[gender],
    "laravel_through_key": laravelThroughKey,
  };
}

enum Gender { ERKEK, ZENAN }

final genderValues = EnumValues({
  "Erkek": Gender.ERKEK,
  "Zenan": Gender.ZENAN
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
