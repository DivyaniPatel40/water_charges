// To parse this JSON data, do
//
//     final customerDetailsModel = customerDetailsModelFromJson(jsonString);

import 'dart:convert';

CustomerDetailsModel customerDetailsModelFromJson(String str) => CustomerDetailsModel.fromJson(json.decode(str));

String customerDetailsModelToJson(CustomerDetailsModel data) => json.encode(data.toJson());

class CustomerDetailsModel {
  CustomerDetailsModel({
    this.success,
    this.data,
  });

  bool? success;
  CustomerDetailsData? data;

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) => CustomerDetailsModel(
    success: json["success"],
    data: CustomerDetailsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };
}

class CustomerDetailsData {
  CustomerDetailsData({
    this.account,
  });

  Account? account;

  factory CustomerDetailsData.fromJson(Map<String, dynamic> json) => CustomerDetailsData(
    account: Account.fromJson(json["account"]),
  );

  Map<String, dynamic> toJson() => {
    "account": account?.toJson(),
  };
}

class Account {
  Account({
    this.name,
    this.phone,
    this.address,
    this.accountId,
    this.discount,
    this.agreements,
  });

  String? name;
  String? phone;
  String? address;
  String? accountId;
  dynamic discount;
  List<AgreementElement>? agreements;

  factory Account.fromJson(Map<String, dynamic> json) => Account(
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    accountId: json["account_id"],
    discount: json["discount"],
    agreements: List<AgreementElement>.from(json["agreements"].map((x) => AgreementElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "address": address,
    "account_id": accountId,
    "discount": discount,
    "agreements": List<dynamic>.from(agreements!.map((x) => x.toJson())),
  };
}

class AgreementElement {
  AgreementElement({
    this.agreement,
    this.payments,
    this.group,
  });

  AgreementAgreement? agreement;
  List<Payment>? payments;
  List<Group>? group;

  factory AgreementElement.fromJson(Map<String, dynamic> json) => AgreementElement(
    agreement: AgreementAgreement.fromJson(json["agreement"]),
    payments: List<Payment>.from(json["payments"].map((x) => Payment.fromJson(x))),
    group: List<Group>.from(json["group"].map((x) => Group.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "agreement": agreement?.toJson(),
    "payments": List<dynamic>.from(payments!.map((x) => x.toJson())),
    "group": List<dynamic>.from(group!.map((x) => x.toJson())),
  };
}

class AgreementAgreement {
  AgreementAgreement({
    this.agreementUuid,
    this.balance,
    this.cashtype,
  });

  String? agreementUuid;
  String? balance;
  String? cashtype;

  factory AgreementAgreement.fromJson(Map<String, dynamic> json) => AgreementAgreement(
    agreementUuid: json["agreement_uuid"],
    balance: json["balance"],
    cashtype: json["cashtype"],
  );

  Map<String, dynamic> toJson() => {
    "agreement_uuid": agreementUuid,
    "balance": balance,
    "cashtype": cashtype,
  };
}

class Group {
  Group({
    this.the0,
    this.groupUuid,
    this.type,
    this.login,
    this.sumOfUnpaidCharges,
  });

  The0? the0;
  String? groupUuid;
  String? type;
  dynamic login;
  String? sumOfUnpaidCharges;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    the0: The0.fromJson(json["0"]),
    groupUuid: json["group_uuid"],
    type: json["type"],
    login: json["login"],
    sumOfUnpaidCharges: json["sum-of-unpaid-charges"],
  );

  Map<String, dynamic> toJson() => {
    "0": the0?.toJson(),
    "group_uuid": groupUuid,
    "type": type,
    "login": login,
    "sum-of-unpaid-charges": sumOfUnpaidCharges,
  };
}

class The0 {
  The0({
    this.tarif,
    this.lastValue,
    this.unpaidCharges,
  });

  Tarif? tarif;
  LastValue? lastValue;
  List<dynamic>? unpaidCharges;

  factory The0.fromJson(Map<String, dynamic> json) => The0(
    tarif: Tarif.fromJson(json["tarif"]),
    lastValue: LastValue.fromJson(json["last-value"]),
    unpaidCharges: List<dynamic>.from(json["unpaid-charges"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "tarif": tarif?.toJson(),
    "last-value": lastValue?.toJson(),
    "unpaid-charges": List<dynamic>.from(unpaidCharges!.map((x) => x)),
  };
}

class LastValue {
  LastValue({
    this.toValue,
    this.toDate,
  });

  int? toValue;
  DateTime? toDate;

  factory LastValue.fromJson(Map<String, dynamic> json) => LastValue(
    toValue: json["to_value"],
    toDate: DateTime.parse(json["to_date"]),
  );

  Map<String, dynamic> toJson() => {
    "to_value": toValue,
    "to_date": "${toDate?.year.toString().padLeft(4, '0')}-${toDate?.month.toString().padLeft(2, '0')}-${toDate?.day.toString().padLeft(2, '0')}",
  };
}

class Tarif {
  Tarif({
    this.name,
    this.type,
    this.price,
    this.onRead,
  });

  String? name;
  String? type;
  double? price;
  int? onRead;

  factory Tarif.fromJson(Map<String, dynamic> json) => Tarif(
    name: json["name"],
    type: json["type"],
    price: json["price"].toDouble(),
    onRead: json["on_read"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "price": price,
    "on_read": onRead,
  };
}

class Payment {
  Payment({
    this.amount,
    this.createdAt,
    this.paytype,
  });

  int? amount;
  DateTime? createdAt;
  String? paytype;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    amount: json["amount"],
    createdAt: DateTime.parse(json["created_at"]),
    paytype: json["paytype"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "created_at": createdAt?.toIso8601String(),
    "paytype": paytype,
  };
}
