
import 'dart:convert';

class Info {
    Info({
        required this.count,
        required this.pages,
        this.next,
        this.prev,
    });

    int count;
    int pages;
    dynamic next;
    dynamic prev;

    factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

    factory Info.fromMap(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

}