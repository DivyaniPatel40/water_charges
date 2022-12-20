// To parse this JSON data, do
//
//     final addressBuildingModel = addressBuildingModelFromJson(jsonString);

import 'dart:convert';

AddressBuildingModel addressBuildingModelFromJson(String str) => AddressBuildingModel.fromJson(json.decode(str));

String addressBuildingModelToJson(AddressBuildingModel data) => json.encode(data.toJson());

class AddressBuildingModel {
  AddressBuildingModel({
    this.data,
    this.success,
  });

  List<Datum>? data;
  bool? success;

  factory AddressBuildingModel.fromJson(Map<String, dynamic> json) => AddressBuildingModel(
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
    this.buildingUuid,
    this.addressId,
    this.stage,
    this.buildingNo,
    this.buildingRegisterNumber,
    this.buildingName,
    this.townId,
    this.cityId,
    this.departmentId,
    this.stateNameTm,
    this.townNameTm,
    this.cityNameTm,
    this.address,
  });

  int? id;
  String? buildingUuid;
  int? addressId;
  BuildingName? stage;
  String? buildingNo;
  BuildingName? buildingRegisterNumber;
  BuildingName? buildingName;
  int? townId;
  int? cityId;
  int? departmentId;
  StateNameTm? stateNameTm;
  TownNameTm? townNameTm;
  CityNameTm? cityNameTm;
  Address? address;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    buildingUuid: json["building_uuid"],
    addressId: json["address_id"],
    stage: buildingNameValues.map![json["stage"]],
    buildingNo: json["building_no"],
    buildingRegisterNumber: buildingNameValues.map![json["building_register_number"]],
    buildingName: buildingNameValues.map![json["building_name"]],
    townId: json["town_id"],
    cityId: json["city_id"],
    departmentId: json["department_id"],
    stateNameTm: stateNameTmValues.map![json["state_name_tm"]],
    townNameTm: townNameTmValues.map![json["town_name_tm"]],
    cityNameTm: cityNameTmValues.map![json["city_name_tm"]],
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "building_uuid": buildingUuid,
    "address_id": addressId,
    "stage": buildingNameValues.reverse[stage],
    "building_no": buildingNo,
    "building_register_number": buildingNameValues.reverse[buildingRegisterNumber],
    "building_name": buildingNameValues.reverse[buildingName],
    "town_id": townId,
    "city_id": cityId,
    "department_id": departmentId,
    "state_name_tm": stateNameTmValues.reverse[stateNameTm],
    "town_name_tm": townNameTmValues.reverse[townNameTm],
    "city_name_tm": cityNameTmValues.reverse[cityNameTm],
    "address": address?.toJson(),
  };
}

class Address {
  Address({
    this.id,
    this.stateId,
    this.villageName,
    this.micrayon,
    this.streetNameOld,
    this.streetNameNew,
    this.streetNameNumber,
  });

  int? id;
  int? stateId;
  String? villageName;
  String? micrayon;
  StreetNameOld? streetNameOld;
  StreetNameNew? streetNameNew;
  String? streetNameNumber;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    stateId: json["state_id"],
    villageName: json["village_name"],
    micrayon: json["micrayon"],
    streetNameOld: streetNameOldValues.map![json["street_name_old"]],
    streetNameNew: streetNameNewValues.map![json["street_name_new"]],
    streetNameNumber: json["street_name_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "state_id": stateId,
    "village_name": villageName,
    "micrayon": micrayon,
    "street_name_old": streetNameOldValues.reverse[streetNameOld],
    "street_name_new": streetNameNewValues.reverse[streetNameNew],
    "street_name_number": streetNameNumber,
  };
}

enum StreetNameNew { GROGLY, ALYIR_NOWAY }

final streetNameNewValues = EnumValues({
  "Alyşir Nowaýy": StreetNameNew.ALYIR_NOWAY,
  "Görogly": StreetNameNew.GROGLY
});

enum StreetNameOld { THE_1_MA, ALYIR_NOWAY }

final streetNameOldValues = EnumValues({
  "Alyşir Nowaýy": StreetNameOld.ALYIR_NOWAY,
  "1 Maý": StreetNameOld.THE_1_MA
});

enum BuildingName { EMPTY, BUILDING_NAME }

final buildingNameValues = EnumValues({
  "": BuildingName.BUILDING_NAME,
  " ": BuildingName.EMPTY
});

enum CityNameTm { KPETDAG }

final cityNameTmValues = EnumValues({
  "Köpetdag": CityNameTm.KPETDAG
});

enum StateNameTm { AGABAT }

final stateNameTmValues = EnumValues({
  "Aşgabat": StateNameTm.AGABAT
});

enum TownNameTm { AGABAT_HERI }

final townNameTmValues = EnumValues({
  "Aşgabat şäheri": TownNameTm.AGABAT_HERI
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
