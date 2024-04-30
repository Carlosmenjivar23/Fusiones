// To parse this JSON data, do
//
//     final imagen = imagenFromJson(jsonString);

import 'dart:convert';

List<Imagen> imagenFromJson(String str) => List<Imagen>.from(json.decode(str).map((x) => Imagen.fromJson(x)));

String imagenToJson(List<Imagen> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Imagen {
    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    Imagen({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
