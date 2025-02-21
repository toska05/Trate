// class RegisterResponseModel {
//   final String token;
//   final String uid;
//   final String error;
//   final String email;

//   RegisterResponseModel({
//     required this.uid, 
//     required this.token, 
//     required this.error,
//     required this.email,
//   });

//   factory RegisterResponseModel.fromJson(Map<String, dynamic> json, String email) {
//     return RegisterResponseModel(
//       uid: json["uid"] ?? 0,
//       token: json["authorization_token"] ?? "",
//       error: json["error"] ?? "",
//       // error: json["error"] is String ? json["error"] : json["error"].toString(),
//       email: email,
//     );
//   }
// }

// class RegisterRequestModel {
//   String email;
//   String password;

//   RegisterRequestModel({
//     this.email = '',
//     this.password = '',
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'email': email.trim(),
//       'password': password.trim(),
//     };
//   }
// }
class RegisterResponseModel {
  final String token;
  final String uid;
  final String error;
  final String email;

  RegisterResponseModel({
    required this.uid, 
    required this.token, 
    required this.error,
    required this.email,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json, String email) {
    return RegisterResponseModel(
      uid: json["uid"] ?? 0,
      token: json["authorization_token"] ?? "",
      error: json["error"] ?? "",
      // error: json["error"] is String ? json["error"] : json["error"].toString(),
      email: email,
    );
  }
}

class RegisterRequestModel {
  String email;
  String password;

  RegisterRequestModel({
    this.email = '',
    this.password = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email.trim(),
      'password': password.trim(),
    };
  }
}
