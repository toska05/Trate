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

  

  final List<Map<String, dynamic>> templates = [
    {
      "user": "alice@example.com",
      "original": "Hello",
      "translated": "Hola",
      "alternative": "Buenos días",
      "language": "Spanish",
      "liked": false,
      "likes": 3,
      "starred": false,
      "stars": 5,
      "aied" : false,
    },
    {
      "user": "bob@example.com",
      "original": "Thank you",
      "translated": "Merci",
      "alternative": "Je vous remercie",
      "language": "French",
      "liked": false,
      "likes": 5,
      "starred": false,
      "stars": 8,
      "aied": false,
    },
    {
      "user": "charlie@example.com",
      "original": "Good morning",
      "translated": "Guten Morgen",
      "alternative": "Guten Tag",
      "language": "German",
      "liked": false,
      "likes": 2,
      "starred": false,
      "stars": 0,
      "aied": false,
    },
  ];

  void _toggleLike(int index) {
    setState(() {
      if (templates[index]["liked"]) {
        templates[index]["likes"]--;
      } else {
        templates[index]["likes"]++;
      }
      templates[index]["liked"] = !templates[index]["liked"];
    });
  }

  void _toggleStar(int index) {
    setState(() {
      if (templates[index]["starred"]) {
        templates[index]["stars"]--;
      } else {
        templates[index]["stars"]++;
      }
      templates[index]["starred"] = !templates[index]["starred"];
    });
  }

  void _toggleAI(int index) {
    setState(() {
      templates[index]["aied"] = !templates[index]["aied"];
    });
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
              final template = templates[index];
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
                            IconButton(
                              icon: Icon(
                                template["aied"] ? Icons.smart_button : Icons.smart_button_outlined,
                                color: template["aied"] ? Colors.blue : Colors.grey,
                              ),
                              onPressed: () => _toggleAI(index),
                            ),
                            IconButton(
                              icon: Icon(
                                template["starred"] ? Icons.star : Icons.star_border,
                                color: template["starred"] ? Colors.yellow : Colors.grey,
                              ),
                              onPressed: () => _toggleStar(index),
                            ),
                            Text(
                              "${template["stars"]}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              icon: Icon(
                                template["liked"] ? Icons.favorite : Icons.favorite_border,
                                color: template["liked"] ? Colors.red : Colors.grey,
                              ),
                              onPressed: () => _toggleLike(index),
                            ),
                            Text(
                              "${template["likes"]}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      if (template["aied"]) ...[
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "AI: ${aiTranslated}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
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



