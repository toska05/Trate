// class LoginResponseModel {
//   final String uid;
//   final String token;
//   final bool validCredentials;
//   final String error;
//   final String email;

//   LoginResponseModel({
//     required this.uid, 
//     required this.token, 
//     required this.validCredentials, 
//     required this.error,
//     required this.email,
//   });

//   factory LoginResponseModel.fromJson(Map<String, dynamic> json, String email) {
//     return LoginResponseModel(
//       uid: json["uid"] ?? 0,
//       token: json["authorization_token"] ?? "",
//       validCredentials: json["valid_credentials"] ?? false,
//       error: json["error"] ?? "",
//       email: email,
//     );
//   }
// }

// class LoginRequestModel {
//   String email;
//   String password;

//   LoginRequestModel({
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

class LoginResponseModel {
  final String uid;
  final String token;
  final bool validCredentials;
  final String error;
  final String email;

  LoginResponseModel({
    required this.uid, 
    required this.token, 
    required this.validCredentials, 
    required this.error,
    required this.email,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json, String email) {
    return LoginResponseModel(
      uid: json["uid"] ?? 0,
      token: json["authorization_token"] ?? "",
      validCredentials: json["valid_credentials"] ?? false,
      error: json["error"] ?? "",
      email: email,
    );
  }
}

class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
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