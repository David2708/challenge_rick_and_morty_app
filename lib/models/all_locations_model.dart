// To parse this JSON data, do
//
//     final allLocationsModel = allLocationsModelFromMap(jsonString);

import 'dart:convert';

import 'info_models.dart';


class AllLocationsModel {
    AllLocationsModel({
        required this.info,
        required this.results,
    });

    Info info;
    List<Location> results;

    factory AllLocationsModel.fromJson(String str) => AllLocationsModel.fromMap(json.decode(str));

    factory AllLocationsModel.fromMap(Map<String, dynamic> json) => AllLocationsModel(
        info: Info.fromMap(json["info"]),
        results: List<Location>.from(json["results"].map((x) => Location.fromMap(x))),
    );
}

class Location {
    Location({
        required this.id,
        required this.name,
        required this.type,
        required this.dimension,
        required this.residents,
        required this.url,
        required this.created,
    });

    int id;
    String name;
    String type;
    String dimension;
    List<String> residents;
    String url;
    DateTime created;

    factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );
}
