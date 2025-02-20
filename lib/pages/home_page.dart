// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:trate/services/test_service.dart';
// import 'package:trate/models/test_model.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

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
  
//   final List<Map<String, dynamic>> translations = [
//     {
//       "user": "alice@example.com",
//       "original": "Hello",
//       "translated": "Hola",
//       "language": "Spanish",
//       "liked": false,
//       "likes": 3,
//     },
//     {
//       "user": "bob@example.com",
//       "original": "Thank you",
//       "translated": "Merci",
//       "language": "French",
//       "liked": false,
//       "likes": 5,
//     },
//     {
//       "user": "charlie@example.com",
//       "original": "Good morning",
//       "translated": "Guten Morgen",
//       "language": "German",
//       "liked": false,
//       "likes": 2,
//     },
//     {
//       "user": "david@example.com",
//       "original": "I love Flutter",
//       "translated": "Me encanta Flutter",
//       "language": "Spanish",
//       "liked": false,
//       "likes": 10,
//     },
//     {
//       "user": "sarah@example.com",
//       "original": "How are you?",
//       "translated": "Wie geht's?",
//       "language": "German",
//       "liked": false,
//       "likes": 7,
//     },
//     {
//       "user": "tom@example.com",
//       "original": "See you later",
//       "translated": "À plus tard",
//       "language": "French",
//       "liked": false,
//       "likes": 4,
//     },
//   ];

//   void _toggleLike(int index) {
//     setState(() {
//       if (translations[index]["liked"]) {
//         translations[index]["likes"]--;
//       } else {
//         translations[index]["likes"]++;
//       }
//       translations[index]["liked"] = !translations[index]["liked"];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context).colorScheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TRATE', style: GoogleFonts.bebasNeue(fontSize: 25)),
//         backgroundColor: theme.primary,
//         centerTitle: true,
//       ),
//       body: Visibility(
//         visible: isLoaded,
//         replacement: const Center(child: CircularProgressIndicator(),),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: ListView.builder(
//             itemCount: translations.length,
//             itemBuilder: (context, index) {
//               final translation = translations[index];
//               return Card(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 elevation: 3,
//                 margin: const EdgeInsets.symmetric(vertical: 8),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ListTile(
//                         leading: const Icon(Icons.g_translate, color: Colors.blueAccent),
//                         // title: Text(
//                         //   translation["original"]!,
//                         //   style: const TextStyle(fontWeight: FontWeight.bold),
//                         // ),
//                         title: Text(posts![index].title, style: TextStyle(fontWeight: FontWeight.bold)),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Text(translation["translated"]!),
//                             Text(posts![index].body ?? ''),
//                             Text(
//                               "Language: ${translation["language"]}",
//                               style: const TextStyle(fontSize: 12, color: Colors.grey),
//                             ),
//                             Text(
//                               "By: ${translation["user"]}",
//                               style: const TextStyle(fontSize: 12, color: Colors.grey),
//                             ),
//                           ],
//                         ),
                        
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min, 
//                           children: [
//                             IconButton(
//                               icon: Icon(
//                                 translation["liked"] ? Icons.favorite : Icons.favorite_border,
//                                 color: translation["liked"] ? Colors.red : Colors.grey,
//                               ),
//                               onPressed: () => _toggleLike(index),
//                             ),
//                             Text(
//                               "${translation["likes"]} likes",
//                               style: const TextStyle(fontSize: 14), 
//                             ),
//                           ],
//                         ),
        
//                       ),
//                       const Divider(),
        
                      
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }







//test

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trate/services/grade_service.dart';
import 'package:trate/models/grade_model.dart';

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
    posts = await GradeService().getPosts();
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
      if (translations[index]["liked"]) {
        translations[index]["likes"]--;
      } else {
        translations[index]["likes"]++;
      }
      translations[index]["liked"] = !translations[index]["liked"];
    });
  }

  void _toggleStar(int index) {
    setState(() {
      if (translations[index]["starred"]) {
        translations[index]["stars"]--;
      } else {
        translations[index]["stars"]++;
      }
      translations[index]["starred"] = !translations[index]["starred"];
    });
  }

  void _toggleAI(int index) {
    setState(() {
      translations[index]["aied"] = !translations[index]["aied"];
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
                        //   translation["original"],
                        //   style: const TextStyle(fontWeight: FontWeight.bold),
                        // ),
                        title: Text(posts![index].originalText, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(translation["translated"]),
                            Text(posts![index].translatedLang),
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
                                translation["aied"] ? Icons.smart_button : Icons.smart_button_outlined,
                                color: translation["aied"] ? Colors.blue : Colors.grey,
                              ),
                              onPressed: () => _toggleAI(index),
                            ),
                            IconButton(
                              icon: Icon(
                                translation["starred"] ? Icons.star : Icons.star_border,
                                color: translation["starred"] ? Colors.yellow : Colors.grey,
                              ),
                              onPressed: () => _toggleStar(index),
                            ),
                            Text(
                              "${translation["stars"]}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            IconButton(
                              icon: Icon(
                                translation["liked"] ? Icons.favorite : Icons.favorite_border,
                                color: translation["liked"] ? Colors.red : Colors.grey,
                              ),
                              onPressed: () => _toggleLike(index),
                            ),
                            Text(
                              "${translation["likes"]}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      if (translation["aied"]) ...[
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "AI: ${translation["alternative"]}",
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
