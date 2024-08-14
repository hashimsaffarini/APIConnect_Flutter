import 'package:api_connect_flutter/core/api/end_points.dart';

class SignInModels {
  final String message;
  final String token;

  SignInModels({required this.message, required this.token});

  factory SignInModels.fromJson(Map<String, dynamic> json) {
    return SignInModels(
      message: json[ApiKey.message],
      token: json[ApiKey.token],
    );
  }
}
