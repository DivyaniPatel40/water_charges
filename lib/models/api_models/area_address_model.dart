// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AreaAddressModel addressModelFromJson(String str) => AreaAddressModel.fromJson(json.decode(str));

String addressModelToJson(AreaAddressModel data) => json.encode(data.toJson());

class AreaAddressModel {
  AreaAddressModel({
    this.data,
    this.success,
  });

  List<Datum>? data;
  bool? success;

  factory AreaAddressModel.fromJson(Map<String, dynamic> json) => AreaAddressModel(
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
    this.cityId,
    this.villageName,
    this.micrayon,
    this.streetNameOld,
    this.streetNameNew,
    this.streetNameNumber,
    this.country,
    this.state,
    this.town,
    this.city,
  });

  int? id;
  int? countryId;
  int? stateId;
  int? townId;
  int? cityId;
  String? villageName;
  String? micrayon;
  String? streetNameOld;
  String? streetNameNew;
  String? streetNameNumber;
  Country? country;
  State? state;
  Town? town;
  City? city;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    countryId: json["country_id"],
    stateId: json["state_id"],
    townId: json["town_id"],
    cityId: json["city_id"],
    villageName: json["village_name"],
    micrayon: json["micrayon"],
    streetNameOld: json["street_name_old"],
    streetNameNew: json["street_name_new"],
    streetNameNumber: json["street_name_number"],
    country: Country.fromJson(json["country"]),
    state: State.fromJson(json["state"]),
    town: Town.fromJson(json["town"]),
    city: City.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_id": countryId,
    "state_id": stateId,
    "town_id": townId,
    "city_id": cityId,
    "village_name": villageName,
    "micrayon": micrayon,
    "street_name_old": streetNameOld,
    "street_name_new": streetNameNew,
    "street_name_number": streetNameNumber,
    "country": country?.toJson(),
    "state": state?.toJson(),
    "town": town?.toJson(),
    "city": city?.toJson(),
  };
}

class City {
  City({
    this.id,
    this.cityNameTm,
  });

  int? id;
  CityNameTm? cityNameTm;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    cityNameTm: cityNameTmValues.map![json["city_name_tm"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_name_tm": cityNameTmValues.reverse[cityNameTm],
  };
}

enum CityNameTm { KPETDAG, BAGTYARLYK }

final cityNameTmValues = EnumValues({
  "Bagtyýarlyk": CityNameTm.BAGTYARLYK,
  "Köpetdag": CityNameTm.KPETDAG
});

class Country {
  Country({
    this.id,
    this.countryNameTm,
  });

  int? id;
  CountryNameTm? countryNameTm;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    countryNameTm: countryNameTmValues.map![json["country_name_tm"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_name_tm": countryNameTmValues.reverse[countryNameTm],
  };
}

enum CountryNameTm { TRKMENISTAN }

final countryNameTmValues = EnumValues({
  "Türkmenistan": CountryNameTm.TRKMENISTAN
});

class State {
  State({
    this.id,
    this.stateNameTm,
  });

  int? id;
  StateNameTm? stateNameTm;

  factory State.fromJson(Map<String, dynamic> json) => State(
    id: json["id"],
    stateNameTm: stateNameTmValues.map![json["state_name_tm"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "state_name_tm": stateNameTmValues.reverse[stateNameTm],
  };
}

enum StateNameTm { AGABAT }

final stateNameTmValues = EnumValues({
  "Aşgabat": StateNameTm.AGABAT
});

class Town {
  Town({
    this.id,
    this.townNameTm,
  });

  int? id;
  TownNameTm? townNameTm;

  factory Town.fromJson(Map<String, dynamic> json) => Town(
    id: json["id"],
    townNameTm: townNameTmValues.map![json["town_name_tm"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "town_name_tm": townNameTmValues.reverse[townNameTm],
  };
}

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
