// To parse this JSON data, do
//
//     final allEpisodesModel = allEpisodesModelFromMap(jsonString);

import 'dart:convert';

import 'info_models.dart';

class AllEpisodesModel {
    AllEpisodesModel({
        required this.info,
        required this.results,
    });

    Info info;
    List<Episode> results;

    factory AllEpisodesModel.fromJson(String str) => AllEpisodesModel.fromMap(json.decode(str));

    factory AllEpisodesModel.fromMap(Map<String, dynamic> json) => AllEpisodesModel(
        info: Info.fromMap(json["info"]),
        results: List<Episode>.from(json["results"].map((x) => Episode.fromMap(x))),
    );

}


class Episode {
    Episode({
        required this.id,
        required this.name,
        required this.airDate,
        required this.episode,
        required this.characters,
        required this.url,
        required this.created,
    });

    int id;
    String name;
    String airDate;
    String episode;
    List<String> characters;
    String url;
    DateTime created;

    factory Episode.fromJson(String str) => Episode.fromMap(json.decode(str));

    factory Episode.fromMap(Map<String, dynamic> json) => Episode(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
    );
}
