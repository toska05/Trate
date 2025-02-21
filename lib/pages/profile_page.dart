// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:trate/services/login_service.dart';
// // // import 'package:trate/pages/form_page.dart';

// // class ProfilePage extends StatefulWidget {
// //   final VoidCallback? onNavigateToForm;

// //   const ProfilePage({Key? key, this.onNavigateToForm}) : super(key: key);

// //   @override
// //   State<ProfilePage> createState() => _ProfilePageState();
// // }

// // class _ProfilePageState extends State<ProfilePage> {
// //   final String userEmail = "${LoginService.getCurrentUserEmail() ?? ''}";

// //   final List<Map<String, String>> exampleTranslations = [
// //     {"original": "Hello", "translated": "Hola"},
// //     {"original": "Thank you", "translated": "Gracias"},
// //     {"original": "Good morning", "translated": "Buenos días"},
// //   ];

// //   void _confirmDeleteAccount() {
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text("Delete Account"),
// //         content: const Text("Are you sure you want to delete your account? This action is irreversible."),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context), 
// //             child: const Text("Cancel"),
// //           ),
// //           TextButton(
// //             onPressed: () {
// //               // TODO: Implement delete account functionality
// //               Navigator.pop(context); 
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 const SnackBar(content: Text("Account deleted successfully.")),
// //               );
// //             },
// //             style: TextButton.styleFrom(foregroundColor: Colors.red),
// //             child: const Text("Delete"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _deleteTranslation(int index) {
// //     setState(() {
// //       exampleTranslations.removeAt(index);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context).colorScheme;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Trate', style: GoogleFonts.bebasNeue(fontSize: 25)),
// //         backgroundColor: Theme.of(context).colorScheme.primary,
// //         centerTitle: true,
// //         actions: [
// //           Padding(
// //             padding: const EdgeInsets.only(right: 10), 
// //             child: Builder(
// //               builder: (context) => IconButton(
// //                 icon: const Icon(Icons.settings),
// //                 onPressed: () => Scaffold.of(context).openEndDrawer(),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
      
// //       endDrawer: Drawer(
// //         child: Column(
// //           children: [
// //             DrawerHeader(
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text('SETTINGS', style: GoogleFonts.bebasNeue(fontSize: 40)),
// //                 ],
// //               ),
// //             ),
            
// //             ListTile(
// //               leading: const Icon(Icons.logout, color: Colors.redAccent),
// //               title: const Text("Logout"),
// //               onTap: () {
// //                 // TODO: Implement logout functionality
// //                 ScaffoldMessenger.of(context).showSnackBar(
// //                   const SnackBar(content: Text("Logged out successfully.")),
// //                 );
// //                 Navigator.pop(context); 
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.delete, color: Colors.redAccent),
// //               title: const Text("Delete Account"),
// //               onTap: _confirmDeleteAccount, 
// //             ),
// //           ],
// //         ),
// //       ),

// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             CircleAvatar(
// //               radius: 50,
// //               backgroundColor: theme.secondary,
// //               child: Icon(Icons.translate, size: 50, color: theme.onSecondary),
// //             ),
// //             const SizedBox(height: 20),
// //             Text(
// //               userEmail,
// //               style: const TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w300),
// //             ),

// //             const SizedBox(height: 35),
// //             Text("Your Translations", style: GoogleFonts.bebasNeue(fontSize: 34, color: theme.onSurface)),
// //             const SizedBox(height: 28),

// //             ElevatedButton.icon(
// //               onPressed: widget.onNavigateToForm,
// //               icon: const Icon(Icons.add),
// //               label: const Text("Add New Translation"),
// //               style: ElevatedButton.styleFrom(
// //                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
// //                 backgroundColor: theme.secondary,
// //                 foregroundColor: theme.onSecondary,
// //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
// //               ),
// //             ),
// //             const SizedBox(height: 20),

// //             // Expanded(
// //             //   child: ListView.builder(
// //             //     itemCount: exampleTranslations.length,
// //             //     itemBuilder: (context, index) {
// //             //       final translation = exampleTranslations[index];
// //             //       return Card(
// //             //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //             //         elevation: 3,
// //             //         margin: const EdgeInsets.symmetric(vertical: 8),
// //             //         child: ListTile(
// //             //           title: Text(translation["original"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
// //             //           subtitle: Text(translation["translated"]!),
// //             //           leading: const Icon(Icons.g_translate, color: Colors.blueAccent),
// //             //         ),
// //             //       );
// //             //     },
// //             //   ),
// //             // ),
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: exampleTranslations.length,
// //                 itemBuilder: (context, index) {
// //                   final translation = exampleTranslations[index];
// //                   return Card(
// //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //                     elevation: 3,
// //                     margin: const EdgeInsets.symmetric(vertical: 8),
// //                     child: ListTile(
// //                       title: Text(
// //                         translation["original"]!,
// //                         style: const TextStyle(fontWeight: FontWeight.bold),
// //                       ),
// //                       subtitle: Text(translation["translated"]!),
// //                       leading: const Icon(Icons.g_translate, color: Colors.blueAccent),
// //                       trailing: IconButton(
// //                         icon: const Icon(Icons.delete, color: Colors.blueAccent),
// //                         onPressed: () => _deleteTranslation(index),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:trate/pages/login_page.dart';
// import 'package:trate/services/session_manager.dart';
// // import 'package:trate/pages/form_page.dart';

// class ProfilePage extends StatefulWidget {
//   final VoidCallback? onNavigateToForm;

//   const ProfilePage({Key? key, this.onNavigateToForm}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final String userEmail = SessionManager().getCurrentUserEmail() ?? '';

//   final List<Map<String, String>> exampleTranslations = [
//     {"original": "Hello", "translated": "Hola"},
//     {"original": "Thank you", "translated": "Gracias"},
//     {"original": "Good morning", "translated": "Buenos dÃ­as"},
//   ];

//   void _confirmDeleteAccount() {
//     showDialog(
//       context: context,
//       builder:
//           (context) => AlertDialog(
//             title: const Text("Delete Account"),
//             content: const Text(
//               "Are you sure you want to delete your account? This action is irreversible.",
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text("Cancel"),
//               ),
//               TextButton(
//                 onPressed: () {
//                   // TODO: Implement delete account functionality
//                   Navigator.pop(context);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text("Account deleted successfully."),
//                     ),
//                   );
//                 },
//                 style: TextButton.styleFrom(foregroundColor: Colors.red),
//                 child: const Text("Delete"),
//               ),
//             ],
//           ),
//     );
//   }

//   void _handleLogout() {
//     SessionManager().logout();
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()),
//       (route) => false,
//     );
//   }

//   void _deleteTranslation(int index) {
//     setState(() {
//       exampleTranslations.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).colorScheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Trate', style: GoogleFonts.bebasNeue(fontSize: 25)),
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: Builder(
//               builder:
//                   (context) => IconButton(
//                     icon: const Icon(Icons.settings),
//                     onPressed: () => Scaffold.of(context).openEndDrawer(),
//                   ),
//             ),
//           ),
//         ],
//       ),

//       endDrawer: Drawer(
//         child: Column(
//           children: [
//             DrawerHeader(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('SETTINGS', style: GoogleFonts.bebasNeue(fontSize: 40)),
//                 ],
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.redAccent),
//               title: const Text("Logout"),
//               onTap: _handleLogout,
//             ),
//             ListTile(
//               leading: const Icon(Icons.delete, color: Colors.redAccent),
//               title: const Text("Delete Account"),
//               onTap: _confirmDeleteAccount,
//             ),
//           ],
//         ),
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: theme.secondary,
//               child: Icon(Icons.translate, size: 50, color: theme.onSecondary),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               userEmail,
//               style: const TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey,
//                 fontWeight: FontWeight.w300,
//               ),
//             ),

//             const SizedBox(height: 35),
//             Text(
//               "Your Translations",
//               style: GoogleFonts.bebasNeue(
//                 fontSize: 34,
//                 color: theme.onSurface,
//               ),
//             ),
//             const SizedBox(height: 28),

//             ElevatedButton.icon(
//               onPressed: widget.onNavigateToForm,
//               icon: const Icon(Icons.add),
//               label: const Text("Add New Translation"),
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 15,
//                 ),
//                 backgroundColor: theme.secondary,
//                 foregroundColor: theme.onSecondary,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: exampleTranslations.length,
//                 itemBuilder: (context, index) {
//                   final translation = exampleTranslations[index];
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     elevation: 3,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       title: Text(
//                         translation["original"]!,
//                         style: const TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(translation["translated"]!),
//                       leading: const Icon(
//                         Icons.g_translate,
//                         color: Colors.blueAccent,
//                       ),
//                       trailing: IconButton(
//                         icon: const Icon(
//                           Icons.delete,
//                           color: Colors.blueAccent,
//                         ),
//                         onPressed: () => _deleteTranslation(index),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trate/pages/login_page.dart';
import 'package:trate/services/session_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfilePage extends StatefulWidget {
  final VoidCallback? onNavigateToForm;

  const ProfilePage({Key? key, this.onNavigateToForm}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String userEmail = SessionManager().getCurrentUserEmail() ?? '';
  List<Map<String, dynamic>> translations = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchTranslations();
  }

  Future<void> _fetchTranslations() async {
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
        Uri.parse('https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/grade_section/mine'),
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
            translations = grade.cast<Map<String, dynamic>>();
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No translations found.")),
          );
        }
      } else {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to fetch translations: ${response.statusCode}")),
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching translations: ${e.toString()}")),
      );
    }
  }

  void _confirmDeleteAccount() {
    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final scaffoldContext = context;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text("Are you sure you want to delete your account? This action is irreversible."),
        actions: [
          TextButton(
            onPressed: () => navigator.pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              navigator.pop(); // Close dialog first
              final user = SessionManager().getCurrentUser();
              final userId = user?.uid;
              final token = user?.token;

              if (userId == null || token == null) {
                if (scaffoldContext.mounted) {
                  messenger.showSnackBar(
                    const SnackBar(content: Text("Session expired. Please login again.")),
                  );
                }
                return;
              }

              try {
                final response = await http.post(
                  Uri.parse('https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/personal/delete/me'),
                  headers: {"Content-Type": "application/json"},
                  body: jsonEncode({
                    "uid": userId,
                    "authorization_token": token
                  }),
                );

                if (response.statusCode == 200) {
                  SessionManager().logout();
                  if (scaffoldContext.mounted) {
                    // Show success message then delay before redirecting
                    messenger.showSnackBar(
                      const SnackBar(content: Text("Account deleted successfully. Redirecting to login...")),
                    );
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.of(scaffoldContext, rootNavigator: true).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => LoginPage()),
                        (route) => false,
                      );
                    });
                  }
                } else {
                  String errorMessage = 'Deletion failed';
                  
                  if (response.body.isEmpty) {
                    errorMessage = 'Server returned empty response';
                  } else if (response.body == '{}') {
                    errorMessage = 'Server returned empty JSON response';
                  } else {
                    try {
                      final dynamic errorData = json.decode(response.body);
                      if (errorData is Map && errorData.isNotEmpty) {
                        errorMessage = errorData['error']?.toString() ??
                                       errorData['message']?.toString() ??
                                       'Deletion failed with status ${response.statusCode}';
                      }
                    } catch (_) {
                      errorMessage = 'Invalid server response: ${response.body}';
                    }
                  }

                  if (scaffoldContext.mounted) {
                    messenger.showSnackBar(
                      SnackBar(content: Text(errorMessage)),
                    );
                  }
                }
              } catch (e) {
                if (scaffoldContext.mounted) {
                  messenger.showSnackBar(
                    SnackBar(content: Text("Deletion failed: ${e.toString()}")),
                  );
                }
              }
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  void _handleLogout() {
    SessionManager().logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  void _deleteTranslation(int index) {
    setState(() {
      translations.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Trate', style: GoogleFonts.bebasNeue(fontSize: 25)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SETTINGS', style: GoogleFonts.bebasNeue(fontSize: 40)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text("Logout"),
              onTap: _handleLogout,
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.redAccent),
              title: const Text("Delete Account"),
              onTap: _confirmDeleteAccount,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: theme.secondary,
              child: Icon(Icons.translate, size: 50, color: theme.onSecondary),
            ),
            const SizedBox(height: 20),
            Text(
              userEmail,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 35),
            Text(
              "Your Translations",
              style: GoogleFonts.bebasNeue(
                fontSize: 34,
                color: theme.onSurface,
              ),
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: widget.onNavigateToForm,
              icon: const Icon(Icons.add),
              label: const Text("Add New Translation"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 15,
                ),
                backgroundColor: theme.secondary,
                foregroundColor: theme.onSecondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: translations.length,
                      itemBuilder: (context, index) {
                        final translation = translations[index];
                        final originalText = translation["original_text"] ?? "";
                        final humanTranslatedText = translation["human_translated"] ?? "";
                        final originalLang = translation["original_lang"] ?? "Unknown";
                        final translatedLang = translation["translated_lang"] ?? "Unknown";

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(
                              originalText,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(humanTranslatedText),
                                const SizedBox(height: 4),
                                Text(
                                  "Translated from $originalLang to $translatedLang",
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                            leading: const Icon(
                              Icons.g_translate,
                              color: Colors.blueAccent,
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () => _deleteTranslation(index),
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
