import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:trate/services/session_manager.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> uploadedTranslations = [];
  List<Future<Map<String, dynamic>>> fetchLikesTasks = [];
  var isLoaded = true;

  @override
  void initState() {
    super.initState();
    _uploadTranslations();
  }

  Future<void> _uploadTranslations() async {
    final user = SessionManager().getCurrentUser();
    final userId = user?.uid;
    final token = user?.token;

    if (userId == null || token == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Session expired. Please login again.")),
        );
      }
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/grade_section'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "uid": userId,
          "authorization_token": token
        }),
      );

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        if (data is Map && data.containsKey('grade')) {
          final List<dynamic> grade = data['grade'];
          List<Future<Map<String, dynamic>>> fetchLikesTasks = [];

          for (var translation in grade) {
            fetchLikesTasks.add(_fetchLikesForTranslation(translation, userId, token));
          }
          

          var translations = await Future.wait(fetchLikesTasks);

          setState(() {
            uploadedTranslations = translations;
            isLoaded = true;
          });
        } else {
          setState(() {
            isLoaded = true;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No translations found.")),
          );
        }
      } else {
        setState(() {
          isLoaded = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to fetch translations: ${response.statusCode}")),
        );
      }
    } catch (e) {
      setState(() {
        isLoaded = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching translations: ${e.toString()}")),
      );
    }
  }

  Future<Map<String, dynamic>> _fetchLikesForTranslation(Map<String, dynamic> translation, String userId, String token) async {
    final id = translation["id"];
    if (id == null) return translation;

    try {
      final likesResponse = await http.get(
        Uri.parse('https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/grade_section/grade/$id/likesamount'),
        headers: {"Content-Type": "application/json"},
      );
      if (likesResponse.statusCode == 200) {
        final likesData = json.decode(likesResponse.body);
        translation["human_likes"] = likesData["human_likes"] ?? 0;
        translation["ai_likes"] = likesData["ai_likes"] ?? 0;
      }

      final likedResponse = await http.post(
        Uri.parse('https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/grade_section/grade/$id/liked'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"uid": userId, "authorization_token": token}),
      );

      if (likedResponse.statusCode == 200) {
        final likedData = json.decode(likedResponse.body);
        translation["liked_human"] = likedData["liked_human"] ?? false;
        translation["liked_ai"] = likedData["liked_ai"] ?? false;
      }
      
    } catch (e) {
      print("Error fetching likes for translation $id: $e");
    }
    return translation;
  }

  void _toggleLikeHuman(int index) async {
    final translation = uploadedTranslations[index];
    final id = translation["id"];
    final user = SessionManager().getCurrentUser();
    final userId = user?.uid;
    final token = user?.token;

    if (id == null || userId == null || token == null) return;

    final bool liked = translation["liked_human"] ?? false;
    final endpoint = liked 
        ? "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/grade_section/grade/$id/human/unlike" 
        : "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/grade_section/grade/$id/human/like";

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"uid": userId, "authorization_token": token}),
      );

      if (response.statusCode == 200) {
        setState(() {
          uploadedTranslations[index] = {
            ...translation,
            "liked_human": !liked,
            "human_likes": (translation["human_likes"] ?? 0) + (liked ? -1 : 1),
          };
        });
      }
    } catch (e) {
      print("Error liking/unliking human translation: $e");
    }
  }

void _toggleLikeAI(int index) async {
  final translation = uploadedTranslations[index];
  final id = translation["id"];
  final user = SessionManager().getCurrentUser();
  final userId = user?.uid;
  final token = user?.token;

  if (id == null || userId == null || token == null) return;


  final bool liked = translation["liked_ai"] ?? false;
  final endpoint = liked 
      ? "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/grade_section/grade/$id/ai/unlike" 
      : "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/grade_section/grade/$id/ai/like";

  try {
    final response = await http.post(
      Uri.parse(endpoint),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"uid": userId, "authorization_token": token}),
    );

    if (response.statusCode == 200) {
      setState(() {
        uploadedTranslations[index] = {
          ...translation,
          "liked_ai": !liked,
          "ai_likes": (translation["ai_likes"] ?? 0) + (liked ? -1 : 1),
        };
      });
    }
  } catch (e) {
    print("Error liking/unliking AI translation: $e");
  }
}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('TRATE', style: GoogleFonts.bebasNeue(fontSize: 25)),
        backgroundColor: theme.primary,
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: uploadedTranslations.length,
            itemBuilder: (context, index) {
              final translation = uploadedTranslations[index];
              final originalText = translation["original_text"] ?? "";
              final humanTranslatedText = translation["human_translated"] ?? "";
              final originalLang = translation["original_lang"] ?? "";
              final translatedLang = translation["translated_lang"] ?? "";
              final aiTranslated = translation["ai_translated"] ?? "";
              final likesHuman = translation["human_likes"] ?? 0;
              final likedHuman = translation["liked_human"] ?? false;
              final likesAi = translation["ai_likes"] ?? 0;
              final likedAi = translation["liked_ai"] ?? false;

              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.g_translate, color: Colors.blueAccent),
                        title: Text(
                              originalText,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(humanTranslatedText),
                            Text("(AI) ${aiTranslated}"),
                            Text(
                              "Translated from $originalLang to $translatedLang",
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("${likesHuman}"),
                            IconButton(
                              icon: Icon(
                                likedHuman ? Icons.favorite : Icons.favorite_border,
                                color: likedHuman ? Colors.red : Colors.grey,
                              ),
                              onPressed: () => _toggleLikeHuman(index),
                            ),

                            Text("${likesAi}"),
                            IconButton(
                              icon: Icon(
                                likedAi ? Icons.star : Icons.star_border,
                                color: likedAi ? Colors.yellow : Colors.grey,
                              ),
                              onPressed: () => _toggleLikeAI(index),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}



