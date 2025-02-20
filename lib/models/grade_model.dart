// import 'dart:convert';
// import 'package:trate/services/session_manager.dart';
// // Post postFromJson(String str) => Post.fromJson(json.decode(str));

// // String postToJson(Post data) => json.encode(data.toJson());
// final String uid = SessionManager().getCurrentUserId() ?? '';
// List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

// String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Post {
//     String id;
//     String originalText;
//     String originalLang;
//     String translatedLang;
//     String humanTranslated;
//     String aiTranslated;

//     Post({
//         required this.id,
//         required this.originalText,
//         required this.originalLang,
//         required this.translatedLang,
//         required this.humanTranslated,
//         required this.aiTranslated,
//     });

//     factory Post.fromJson(Map<String, dynamic> json) => Post(
//         id: json["id"],
//         originalText: json["original_text"],
//         originalLang: json["original_lang"],
//         translatedLang: json["translated_lang"],
//         humanTranslated: json["human_translated"],
//         aiTranslated: json["ai_translated"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "original_text": originalText,
//         "original_lang": originalLang,
//         "translated_lang": translatedLang,
//         "human_translated": humanTranslated,
//         "ai_translated": aiTranslated,
//     };
// }

// class GradeRequestModel {
//   String uid;

//   GradeRequestModel({
//     this.uid = '',
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'uid': uid.trim(),
//     };
//   }
// }

import 'dart:convert';
import 'package:trate/services/session_manager.dart';

final String uid = SessionManager().getCurrentUserId() ?? '';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  String id;
  String originalText;
  String originalLang;
  String translatedLang;
  String humanTranslated;
  String aiTranslated;

  Post({
    required this.id,
    required this.originalText,
    required this.originalLang,
    required this.translatedLang,
    required this.humanTranslated,
    required this.aiTranslated,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"] ?? '',
        originalText: json["original_text"] ?? '',
        originalLang: json["original_lang"] ?? '',
        translatedLang: json["translated_lang"] ?? '',
        humanTranslated: json["human_translated"] ?? '',
        aiTranslated: json["ai_translated"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "original_text": originalText,
        "original_lang": originalLang,
        "translated_lang": translatedLang,
        "human_translated": humanTranslated,
        "ai_translated": aiTranslated,
      };

}

class GradeRequestModel {
  String uid;

  GradeRequestModel({
    this.uid = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid.trim(),
    };
  }
}
