import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trate/services/test_service.dart';
import 'package:trate/models/test_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    posts = await TestService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }
  
  final List<Map<String, dynamic>> translations = [
    {
      "user": "alice@example.com",
      "original": "Hello",
      "translated": "Hola",
      "language": "Spanish",
      "liked": false,
      "likes": 3,
      "comments": [
        {"user": "john@example.com", "text": "Great translation!"},
        {"user": "susan@example.com", "text": "Super helpful!"},
        {"user": "mike@example.com", "text": "I use this all the time."}
      ]
    },
    {
      "user": "bob@example.com",
      "original": "Thank you",
      "translated": "Merci",
      "language": "French",
      "liked": false,
      "likes": 5,
      "comments": [
        {"user": "anna@example.com", "text": "Simple but useful."},
        {"user": "paul@example.com", "text": "Thanks for sharing!"}
      ]
    },
    {
      "user": "charlie@example.com",
      "original": "Good morning",
      "translated": "Guten Morgen",
      "language": "German",
      "liked": false,
      "likes": 2,
      "comments": [
        {"user": "lisa@example.com", "text": "Good one!"},
        {"user": "mark@example.com", "text": "I say this every day."}
      ]
    },
    {
      "user": "david@example.com",
      "original": "I love Flutter",
      "translated": "Me encanta Flutter",
      "language": "Spanish",
      "liked": false,
      "likes": 10,
      "comments": [
        {"user": "kevin@example.com", "text": "Flutter is awesome!"},
        {"user": "emma@example.com", "text": "Completely agree!"},
        {"user": "noah@example.com", "text": "Flutter FTW!"}
      ]
    },
    {
      "user": "sarah@example.com",
      "original": "How are you?",
      "translated": "Wie geht's?",
      "language": "German",
      "liked": false,
      "likes": 7,
      "comments": [
        {"user": "daniel@example.com", "text": "Useful phrase!"},
        {"user": "olivia@example.com", "text": "Thanks for sharing!"}
      ]
    },
    {
      "user": "tom@example.com",
      "original": "See you later",
      "translated": "À plus tard",
      "language": "French",
      "liked": false,
      "likes": 4,
      "comments": [
        {"user": "chris@example.com", "text": "Nice one!"},
        {"user": "sophie@example.com", "text": "I use this often."}
      ]
    },
  ];

  void _toggleLike(int index) {
    setState(() {
      if (translations[index]["liked"]) {
        translations[index]["likes"]--;
      } else {
        translations[index]["likes"]++;
      }
      translations[index]["liked"] = !translations[index]["liked"];
    });
  }

  // void _addComment(int index, String comment) {
  //   setState(() {
  //     translations[index]["comments"].add({
  //       "user": "you@example.com", 
  //       "text": comment
  //     });
  //   });
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(content: Text("Comment added!")),
  //   );
  // }

  // void _showCommentDialog(int index) {
  //   final TextEditingController commentController = TextEditingController();
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text("Add a Comment"),
  //       content: TextField(
  //         controller: commentController,
  //         decoration: const InputDecoration(hintText: "Write your comment..."),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text("Cancel"),
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             if (commentController.text.isNotEmpty) {
  //               _addComment(index, commentController.text);
  //             }
  //             Navigator.pop(context);
  //           },
  //           child: const Text("Add"),
  //         ),
  //       ],
  //     ),
  //   );
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
        replacement: const Center(child: CircularProgressIndicator(),),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: translations.length,
            itemBuilder: (context, index) {
              final translation = translations[index];
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
                        // title: Text(
                        //   translation["original"]!,
                        //   style: const TextStyle(fontWeight: FontWeight.bold),
                        // ),
                        title: Text(posts![index].title, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(translation["translated"]!),
                            Text(posts![index].body ?? ''),
                            Text(
                              "Language: ${translation["language"]}",
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              "By: ${translation["user"]}",
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min, 
                          children: [
                            IconButton(
                              icon: Icon(
                                translation["liked"] ? Icons.favorite : Icons.favorite_border,
                                color: translation["liked"] ? Colors.red : Colors.grey,
                              ),
                              onPressed: () => _toggleLike(index),
                            ),
                            Text(
                              "${translation["likes"]} likes",
                              style: const TextStyle(fontSize: 14), 
                            ),
                          ],
                        ),
        
                      ),
                      const Divider(),
        
                      // Comments Section
                      // Text(
                      //   "Comments:",
                      //   style: GoogleFonts.bebasNeue(fontSize: 20, color: theme.onSurface),
                      // ),
                      // ...translation["comments"].map<Widget>((comment) => Padding(
                      //       padding: const EdgeInsets.symmetric(vertical: 4),
                      //       child: Row(
                      //         children: [
                      //           const Icon(Icons.comment, size: 16, color: Colors.grey),
                      //           const SizedBox(width: 8),
                      //           Expanded(
                      //             child: Text(
                      //               "${comment["user"]}: ${comment["text"]}",
                      //               style: const TextStyle(fontSize: 14),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     )),
        
                      // Add Comment Button (Better Placement)
                      // Align(
                      //   alignment: Alignment.centerRight,
                      //   child: ElevatedButton.icon(
                      //     onPressed: () => _showCommentDialog(index),
                      //     icon: const Icon(Icons.add_comment, size: 20, color: Colors.white),
                      //     label: const Text("Add Comment"),
                      //     style: ElevatedButton.styleFrom(
                      //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      //       backgroundColor: theme.primary,
                      //       foregroundColor: Colors.white,
                      //     ),
                      //   ),
                      // ),
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


// ______________________________________________________________________________________________________



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:trate/services/test_service.dart';
// import 'package:trate/models/test_model.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Post>? posts;
//   var isLoaded = false;

//   @override
//   void initState() {
//     super.initState();

//     getData();
//   }

//   getData() async {
//     posts = await TestService().getPosts();
//     if (posts != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TRATE', style: GoogleFonts.bebasNeue(fontSize: 25)),
//         centerTitle: true,
//       ),
//       body: Visibility(
//         visible: isLoaded,
//         replacement: const Center(child: CircularProgressIndicator(),),
//         child: ListView.builder(
//           itemCount: posts?.length,
//           itemBuilder: (context, index) {
//             return Container(
//               child: Column(
//                 children: [
//                   Text(posts![index].title, style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500)),
//                   Text(posts![index].body ?? ''),
//                 ],
//               ),
//             );
//           }
//         ),
//       )
//     );
//   }
// }
