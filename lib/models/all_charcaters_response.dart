
// To parse this JSON data, do
//
//     final allCharactersResponse = allCharactersResponseFromMap(jsonString);

import 'dart:convert';

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

class Info {
    Info({
        required this.count,
        required this.pages,
        required this.next,
        this.prev,
    });

    int count;
    int pages;
    String next;
    dynamic prev;

    factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

    factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

}

class Character {
    Character({
        required this.id,
        required this.name,
        required this.status,
        required this.species,
        required this.type,
        this.gender,
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
    Gender? gender;
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
        gender: genderValues.map[json["gender"]],
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

class Location {
    Location({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
    );

}

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
