// To parse this JSON data, do
//
//     final fruitsModel = fruitsModelFromJson(jsonString);

import 'dart:convert';

FruitsModel fruitsModelFromJson(String str) =>
    FruitsModel.fromJson(json.decode(str));

String fruitsModelToJson(FruitsModel data) => json.encode(data.toJson());

class FruitsModel {
  FruitsModel({
    this.message,
    this.code,
    this.data,
  });

  String? message;
  int? code;
  FruitsData? data;

  factory FruitsModel.fromJson(Map<String, dynamic> json) => FruitsModel(
        message: json["message"],
        code: json["code"],
        data: json["data"] == null ? null : FruitsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "data": data == null ? null : data!.toJson(),
      };
}

class FruitsData {
  FruitsData({
    this.imagesReferences,
    this.rawImagesReferences,
    this.fruits,
  });

  ImagesReferences? imagesReferences;
  Map<String, dynamic>? rawImagesReferences;
  List<Fruit>? fruits;

  factory FruitsData.fromJson(Map<String, dynamic> json) => FruitsData(
        imagesReferences: json["imagesReferences"] == null
            ? null
            : ImagesReferences.fromJson(json["imagesReferences"]),
        rawImagesReferences: json["imagesReferences"],
        fruits: json["fruits"] == null
            ? null
            : List<Fruit>.from(json["fruits"].map((x) => Fruit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "imagesReferences":
            imagesReferences == null ? null : imagesReferences!.toJson(),
        "rawImagesReferences": rawImagesReferences,
        "fruits": fruits == null
            ? null
            : List<dynamic>.from(fruits!.map((x) => x.toJson())),
      };
}

class Fruit {
  Fruit({
    this.name,
    this.price,
  });

  String? name;
  int? price;

  factory Fruit.fromJson(Map<String, dynamic> json) => Fruit(
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
      };
}

class ImagesReferences {
  ImagesReferences({
    this.apple,
    this.manggo,
    this.banana,
    this.avocado,
    this.melon,
  });

  String? apple;
  String? manggo;
  String? banana;
  String? avocado;
  String? melon;

  factory ImagesReferences.fromJson(Map<String, dynamic> json) =>
      ImagesReferences(
        apple: json["apple"],
        manggo: json["manggo"],
        banana: json["banana"],
        avocado: json["avocado"],
        melon: json["melon"],
      );

  Map<String, dynamic> toJson() => {
        "apple": apple,
        "manggo": manggo,
        "banana": banana,
        "avocado": avocado,
        "melon": melon,
      };
}
