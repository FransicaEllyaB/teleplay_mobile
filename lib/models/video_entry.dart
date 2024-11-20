// To parse this JSON data, do
//
//     final moodEntry = moodEntryFromJson(jsonString);

import 'dart:convert';

List<MoodEntry> moodEntryFromJson(String str) =>
    List<MoodEntry>.from(json.decode(str).map((x) => MoodEntry.fromJson(x)));

String moodEntryToJson(List<MoodEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoodEntry {
  String model;
  String pk;
  Fields fields;

  MoodEntry({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory MoodEntry.fromJson(Map<String, dynamic> json) => MoodEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int price;
  String description;
  DateTime releaseDate;
  String duration;
  String videoThumbnail;

  Fields({
    required this.user,
    required this.name,
    required this.price,
    required this.description,
    required this.releaseDate,
    required this.duration,
    required this.videoThumbnail,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        releaseDate: DateTime.parse(json["release_date"]),
        duration: json["duration"],
        videoThumbnail: json["video_thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "duration": duration,
        "video_thumbnail": videoThumbnail,
      };
}
