import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trate/models/tranlation_data_model.dart';
import 'package:trate/services/translation_data_service.dart';
import 'package:trate/services/session_manager.dart';


class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final String userUid = SessionManager().getCurrentUserId() ?? '';
  final _textController = TextEditingController();
  final _translationController = TextEditingController();
  String _selectedLanguageone = 'English';
  String _selectedLanguagetwo = 'English';

  final List<String> _languages = [
    "English", "Italian", "Polish"
  ];

  @override
  void dispose() {
    _textController.dispose();
    _translationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Trate', style: GoogleFonts.bebasNeue(fontSize: 25)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      backgroundColor: theme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ready to Translate?',
                  style: GoogleFonts.bebasNeue(fontSize: 45, color: theme.onSurface),
                ),
                const SizedBox(height: 30),

                DropdownButtonFormField<String>(
                  value: _selectedLanguageone,
                  decoration: InputDecoration(
                    labelText: "Select language for the original text",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: theme.surface,
                  ),
                  items: _languages.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(
                        lang,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLanguageone = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 15),

                TextField(
                  controller: _textController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Text to be translated",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: theme.surface,
                  ),
                ),
                const SizedBox(height: 15),

                DropdownButtonFormField<String>(
                  value: _selectedLanguagetwo,
                  decoration: InputDecoration(
                    labelText: "Select language for you translation",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: theme.surface,
                  ),
                  items: _languages.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(
                        lang,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLanguagetwo = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 15),

                TextField(
                  controller: _translationController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: "Your translation",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    filled: true,
                    fillColor: theme.surface,
                  ),
                ),

                const SizedBox(height: 25),

                ElevatedButton(
                  onPressed: () async {
                    if (_textController.text.isNotEmpty && _translationController.text.isNotEmpty) {
                      Post newPost = Post(
                        uid: userUid,
                        originalText: _textController.text,
                        originalLang: _selectedLanguageone,
                        translatedText: _translationController.text,
                        translatedLang: _selectedLanguagetwo,
                      );

                      DataService dataService = DataService();
                      bool success = await dataService.saveTranslation(newPost);

                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Translation saved successfully!"))
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Failed to save translation!"))
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill in both fields!"))
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.secondary,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Publish',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
