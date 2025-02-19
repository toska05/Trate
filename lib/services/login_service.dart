import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:trate/models/login_model.dart';

class LoginService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/auth/login";
    
    final response = await http.post(
      Uri.parse(url),
      body: requestModel.toJson(),
    );
    
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception(response.statusCode);
    }
  }
}




// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:trate/models/login_model.dart';

// class LoginService {
//   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
//     String url = "https://dcvsetdr5bygvesetvbgdewaxqcaefgt.uk/auth/login";  // Upewnij się, że URL jest pełny i poprawny

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {"Content-Type": "application/json"},  // Nagłówek informujący o formacie JSON
//         body: jsonEncode(requestModel.toJson()), // Zamiana obiektu na JSON
//       );

//       if (response.statusCode == 200 || response.statusCode == 400) {
//         return LoginResponseModel.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Błąd logowania: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Błąd połączenia: $e');
//     }
//   }
// }





// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:trate/pages/login/login_model.dart';
// import 'package:trate/components/custom_http_client.dart'; 

// class APIService {
//   final http.Client client = CustomHttpClient.create(); 

//   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
//     String url = "https://34.34.140.113/";

//     try {
//       final response = await client.post(
//         Uri.parse(url),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(requestModel.toJson()),
//       );

//       if (response.statusCode == 200 || response.statusCode == 400) {
//         return LoginResponseModel.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Błąd logowania: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('Błąd połączenia: $e');
//     }
//   }
// }
