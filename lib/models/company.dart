import 'dart:convert';

class Company {
  Company({
    this.id,
    this.name,
    this.phone,
    this.adress,
    this.email,
    this.raison,
    this.domaine,
    this.password,
    this.quartier,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  dynamic id;
  dynamic name;
  dynamic phone;
  dynamic adress;
  dynamic email;
  dynamic raison;
  dynamic domaine;
  dynamic password;
  dynamic quartier;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

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
