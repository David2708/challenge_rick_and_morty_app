import 'dart:convert';

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