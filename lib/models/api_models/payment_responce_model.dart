// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PaymentResponce categoryFromJson(String str) => PaymentResponce.fromJson(json.decode(str));

String categoryToJson(PaymentResponce data) => json.encode(data.toJson());

class PaymentResponce {
  PaymentResponce({
    @required this.success,
    @required this.data,
  });

  bool? success;
  Data? data;

  factory PaymentResponce.fromJson(Map<String, dynamic> json) => PaymentResponce(
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    @required this.receipt,
    @required this.amount,
    @required this.chargeCreated,
    @required this.created,
  });

  String? receipt;
  int? amount;
  bool? chargeCreated;
  DateTime? created;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    receipt: json["receipt"],
    amount: json["amount"],
    chargeCreated: json["charge_created"],
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "receipt": receipt,
    "amount": amount,
    "charge_created": chargeCreated,
    "created": created?.toIso8601String(),
  };
}
