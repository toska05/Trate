class RegisterResponseModel {
  final String token;
  final String error;

  RegisterResponseModel({required this.token, required this.error});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      token: json["token"] ?? "",
      error: json["error"] ?? "",
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
