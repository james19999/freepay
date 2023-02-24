import 'dart:convert';

class Company {
  Company({
    this.id,
    this.name,
    this.img,
    this.phone,
    this.adress,
    this.email,
    this.raison,
    this.description,
    this.password,
    this.quartier,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  dynamic id;
  dynamic name;
  dynamic img;
  dynamic phone;
  dynamic adress;
  dynamic email;
  dynamic raison;
  dynamic description;
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
        img: json["img"],
        phone: json["phone"],
        adress: json["adress"],
        email: json["email"],
        raison: json["raison"],
        description: json["description"],
        password: json["password"],
        quartier: json["quartier"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "phone": phone,
        "adress": adress,
        "email": email,
        "raison": raison,
        "description": description,
        "password": password,
        "quartier": quartier,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
