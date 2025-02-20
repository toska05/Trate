import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trate/models/tranlation_data_model.dart';

// class DataService {
//   Future<List<Post>?> getPosts() async {
//     var client = http.Client();

//     try {
//       var uri = Uri.parse('https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/processtranslation');
//       var response = await client.get(uri);

//       if (response.statusCode == 200 || response.statusCode == 400) {
//         var jsonData = json.decode(response.body) as List;
//         List<Post> posts = jsonData.map((item) => Post.fromJson(item)).toList();

//         for (int i = 0; i < posts.length; i++) {
//           print("User index: $i");
//         }

//         return posts;
//       } else {
//         throw Exception('Failed to load data!');
//       }
//     } finally {
//       client.close();
//     }
//   }
// }

class DataService {
  Future<bool> saveTranslation(Post post) async {
    var client = http.Client();
    var uri = Uri.parse('https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/processtranslation');

    try {
      var response = await client.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(post.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    } finally {
      client.close();
    }
  }
}

