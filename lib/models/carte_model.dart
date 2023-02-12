import 'dart:convert';

class Carte {
  Carte({
    this.id,
    this.code,
    this.created,
    this.amount,
    this.qrcode,
    this.companyId,
    this.clientId,
    this.status,
    this.company,
  });

  int? id;
  String? code;
  dynamic created;
  String? amount;
  String? qrcode;
  String? companyId;
  String? clientId;
  int? status;

  Company? company;

  factory Carte.fromRawJson(String str) => Carte.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Carte.fromJson(Map<String, dynamic> json) => Carte(
        id: json["id"],
        code: json["code"],
        created: DateTime.parse(json["created"]),
        amount: json["amount"],
        qrcode: json["qrcode"],
        companyId: json["company_id"],
        clientId: json["client_id"],
        status: json["status"],
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "qrcode": qrcode,
        "company_id": companyId,
        "client_id": clientId,
        "status": status,
        "company": company!.toJson(),
      };
}

class Company {
  Company({
    required this.id,
    required this.name,
    required this.phone,
    required this.adress,
    required this.email,
    required this.raison,
    required this.domaine,
    required this.password,
    required this.quartier,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String phone;
  String adress;
  String email;
  String raison;
  String domaine;
  String password;
  String quartier;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        adress: json["adress"],
        email: json["email"],
        raison: json["raison"],
        domaine: json["domaine"],
        password: json["password"],
        quartier: json["quartier"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "adress": adress,
        "email": email,
        "raison": raison,
        "domaine": domaine,
        "password": password,
        "quartier": quartier,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
