import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trate/models/tranlation_data_model.dart';

class DataService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    try {
      var uri = Uri.parse('http://34.34.140.113/processtranslationcontent-type: application/json');
      var response = await client.get(uri);

      if (response.statusCode == 200 || response.statusCode == 400) {
        var jsonData = json.decode(response.body) as List;
        List<Post> posts = jsonData.map((item) => Post.fromJson(item)).toList();

        for (int i = 0; i < posts.length; i++) {
          print("User index: $i");
        }

        return posts;
      } else {
        throw Exception('Failed to load data!');
      }
    } finally {
      client.close();
    }
  }
}
