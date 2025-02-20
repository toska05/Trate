// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class FormPage extends StatefulWidget {
//   const FormPage({super.key});

//   @override
//   State<FormPage> createState() => _FormPageState();
// }

// class _FormPageState extends State<FormPage> {

//   final _textController = TextEditingController();
//   final _translationController = TextEditingController();

//   @override
//   void dispose(){
//     _textController.dispose();
//     _translationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Ready to Translate?',
//                 style: GoogleFonts.bebasNeue(
//                   fontSize: 55,
//                 ),
//               ),
//               const SizedBox(height: 40),
//               // First name
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: TextField(
//                   controller: _textController,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: const Color.fromARGB(255, 26, 14, 84)),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     hintText: 'Text to be translated',
//                     fillColor: Colors.grey[100],
//                     filled: true,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               // Last name
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: TextField(
//                   controller: _translationController,
//                   decoration: InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                           color: const Color.fromARGB(255, 26, 14, 84)),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     hintText: 'Your translation',
//                     fillColor: Colors.grey[100],
//                     filled: true,
//                   ),
//                 ),
//               ),
              
//               const SizedBox(height: 25),
//               // Sign up button
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 50.0),
//                 child: GestureDetector(
//                   // onTap: ,
//                   child: Container(
//                     padding: const EdgeInsets.all(15),
//                     decoration: BoxDecoration(
//                       color: Colors.green[300],
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Post Translation',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _textController = TextEditingController();
  final _translationController = TextEditingController();
  String _selectedLanguage = 'English';

  final List<String> _languages = [
    "English", "Italian", "Polsih"
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
                  value: _selectedLanguage,
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
                      _selectedLanguage = newValue!;
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
                  value: _selectedLanguage,
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
                      _selectedLanguage = newValue!;
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
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Translation posted!"))
                    );
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
