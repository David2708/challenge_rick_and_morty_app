
// To parse this JSON data, do
//
//     final allCharactersResponse = allCharactersResponseFromMap(jsonString);

import 'dart:convert';

import 'info_models.dart';
import 'location_model.dart';


class AllCharactersResponse {
    AllCharactersResponse({
        required this.info,
        required this.results,
    });

    Info info;
    List<Character> results;

    factory AllCharactersResponse.fromJson(String str) => AllCharactersResponse.fromMap(json.decode(str));

    factory AllCharactersResponse.fromMap(Map<String, dynamic> json) => AllCharactersResponse(
        info: Info.fromMap(json["info"]),
        results: List<Character>.from(json["results"].map((x) => Character.fromMap(x))),
    );

}

class Character {
    Character({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        required this.gender,
        required this.origin,
        required this.location,
        required this.image,
        required this.episode,
        required this.url,
        required this.created,
    });

    int id;
    String name;
    String status;
    String species;
    String type;
    String gender;
    Location origin;
    Location location;
    String image;
    List<String> episode;
    String url;
    DateTime created;

    factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

    factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: Location.fromMap(json["origin"]),
        location: Location.fromMap(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );

}

enum Gender { MALE, FEMALE, UNKNOWN }

final genderValues = EnumValues({
    "Female": Gender.FEMALE,
    "Male": Gender.MALE,
    "unknown": Gender.UNKNOWN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
