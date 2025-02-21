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
  var isLoaded = true;

  @override
  void initState() {
    super.initState();
    _uploadTranslations();
  }

  // Future<void> _uploadTranslations() async {
  //   final user = SessionManager().getCurrentUser();
  //   final userId = user?.uid;
  //   final token = user?.token;

  //   if (userId == null || token == null) {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("Session expired. Please login again.")),
  //       );
  //     }
  //     return;
  //   }

  //   try {
  //     final response = await http.post(
  //       Uri.parse('https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/grade_section'),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode({
  //         "uid": userId,
  //         "authorization_token": token
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       final dynamic data = json.decode(response.body);
  //       print("API Response: ${response.body}");

  //       if (data is Map && data.containsKey('grade')) {
  //         final List<dynamic> grade = data['grade'];
  //         setState(() {
  //           uploadedTranslations = grade.cast<Map<String, dynamic>>();
  //           isLoaded = true;
  //         });
  //       } else {
  //         setState(() {
  //           isLoaded = true;
  //         });
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text("No translations found.")),
  //         );
  //       }
  //     } else {
  //       setState(() {
  //         isLoaded = true;
  //       });
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Failed to fetch translations: ${response.statusCode}")),
  //       );
  //     }
  //   } catch (e) {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Error fetching translations: ${e.toString()}")),
  //     );
  //   }
  // }


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
        print("API Response: ${response.body}");

        if (data is Map && data.containsKey('grade')) {
          final List<dynamic> grade = data['grade'];
          List<Future<void>> fetchLikesTasks = [];

          for (var translation in grade) {
            fetchLikesTasks.add(_fetchLikesForTranslation(translation, userId, token));
          }

          await Future.wait(fetchLikesTasks);

          setState(() {
            uploadedTranslations = grade.cast<Map<String, dynamic>>();
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

  Future<void> _fetchLikesForTranslation(Map<String, dynamic> translation, String userId, String token) async {
    final id = translation["id"];
    if (id == null) return;

    try {
      final likesResponse = await http.post(
        Uri.parse('https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/grade_section/grade/$id/likesamount'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"uid": userId, "authorization_token": token}),
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
          translation["liked_human"] = !liked;
          translation["human_likes"] += liked ? -1 : 1;
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
        translation["liked_ai"] = !liked;
        translation["ai_likes"] += liked ? -1 : 1;
      });
    }
  } catch (e) {
    print("Error liking/unliking AI translation: $e");
  }
}

  // void _toggleAI(int index) {
  //   setState(() {
  //     templates[index]["aied"] = !templates[index]["aied"];
  //   });
  // }

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
              // final template = templates[index];
              final translation = uploadedTranslations[index];
              final userUid = translation["id"] ?? "";
              final originalText = translation["original_text"] ?? "";
              final humanTranslatedText = translation["human_translated"] ?? "";
              final originalLang = translation["original_lang"] ?? "";
              final translatedLang = translation["translated_lang"] ?? "";
              final aiTranslated = translation["ai_translated"] ?? "";

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
                            Text(
                              "Translated from $originalLang to $translatedLang",
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              "By: ${userUid}",
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("${translation["human_likes"]}"),
                            IconButton(
                              icon: Icon(
                                translation["liked_human"] ? Icons.favorite : Icons.favorite_border,
                                color: translation["liked_human"] ? Colors.red : Colors.grey,
                              ),
                              onPressed: () => _toggleLikeHuman(index),
                            ),

                            Text("${translation["ai_likes"]}"),
                            IconButton(
                              icon: Icon(
                                translation["liked_ai"] ? Icons.star : Icons.star_border,
                                color: translation["liked_ai"] ? Colors.yellow : Colors.grey,
                              ),
                              onPressed: () => _toggleLikeAI(index),
                            ),
                          ],
                        ),
                      ),
                      // if (template["aied"]) ...[
                      //   const Divider(),
                      //   Padding(
                      //     padding: const EdgeInsets.only(top: 8),
                      //     child: Text(
                      //       "AI: ${aiTranslated}",
                      //       style: const TextStyle(fontSize: 16),
                      //     ),
                      //   ),
                      // ],
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



