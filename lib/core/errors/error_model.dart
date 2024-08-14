import 'package:api_connect_flutter/core/api/end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      //? get the status and errorMessage from the api response
      status: json[ApiKey.status],
      errorMessage: json[ApiKey.errorMessage],
    );
  }
}
