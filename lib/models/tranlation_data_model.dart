import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    String uid;
    String originalText;
    String originalLang;
    String translatedText;
    String translatedLang;

    Post({
        required this.uid,
        required this.originalText,
        required this.originalLang,
        required this.translatedText,
        required this.translatedLang,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        uid: json["uid"],
        originalText: json["original_text"],
        originalLang: json["original_lang"],
        translatedText: json["translated_text"],
        translatedLang: json["translated_lang"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "original_text": originalText,
        "original_lang": originalLang,
        "translated_text": translatedText,
        "translated_lang": translatedLang,
    };
}
