// To parse this JSON data, do
//
//     final addressCityModel = addressCityModelFromJson(jsonString);

import 'dart:convert';

AddressCityModel addressCityModelFromJson(String str) => AddressCityModel.fromJson(json.decode(str));

String addressCityModelToJson(AddressCityModel data) => json.encode(data.toJson());

class AddressCityModel {
  AddressCityModel({
    this.data,
    this.success,
  });

  List<Datum>? data;
  bool? success;

  factory AddressCityModel.fromJson(Map<String, dynamic> json) => AddressCityModel(
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
    this.countryId,
    this.stateId,
    this.townId,
    this.cityNameTm,
    this.cityNameRu,
    this.country,
    this.state,
    this.town,
  });

  int? id;
  int? countryId;
  int? stateId;
  int? townId;
  String? cityNameTm;
  String? cityNameRu;
  Country? country;
  State? state;
  Town? town;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    townId: json["town_id"],
    cityNameTm: json["city_name_tm"],
    cityNameRu: json["city_name_ru"],
    country: Country.fromJson(json["country"]),
    state: State.fromJson(json["state"]),
    town: Town.fromJson(json["town"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_id": countryId,
    "state_id": stateId,
    "town_id": townId,
    "city_name_tm": cityNameTm,
    "city_name_ru": cityNameRu,
    "country": country?.toJson(),
    "state": state?.toJson(),
    "town": town?.toJson(),
  };
}

class Country {
  Country({
    this.id,
    this.countryNameTm,
  });

  int? id;
  String? countryNameTm;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    countryNameTm: json["country_name_tm"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_name_tm": countryNameTm,
  };
}

class State {
  State({
    this.id,
    this.stateNameTm,
  });

  int? id;
  String? stateNameTm;

  factory State.fromJson(Map<String, dynamic> json) => State(
    id: json["id"],
    stateNameTm: json["state_name_tm"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "state_name_tm": stateNameTm,
  };
}

class Town {
  Town({
    this.id,
    this.townNameTm,
  });

  int? id;
  String? townNameTm;

  factory Town.fromJson(Map<String, dynamic> json) => Town(
    id: json["id"],
    townNameTm: json["town_name_tm"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "town_name_tm": townNameTm,
  };
}


