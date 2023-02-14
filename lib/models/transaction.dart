// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Transaction {
  Transaction({
    this.id,
    this.title,
    this.created,
    this.amount,
    this.cartcode,
    this.status,
    this.code_tansaction,
  });

  dynamic id;
  dynamic title;
  dynamic created;
  dynamic amount;
  dynamic cartcode;
  dynamic code_tansaction;
  dynamic status;

  factory Transaction.fromRawJson(String str) =>
      Transaction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        title: json["title"],
        created: DateTime.parse(json["created"]),
        amount: json["amount"],
        cartcode: json["cartcode"],
        status: json["status"],
        code_tansaction: json["code_tansaction"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "created":
            "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "cartcode": cartcode,
        "status": status,
        "status": code_tansaction,
      };
}
