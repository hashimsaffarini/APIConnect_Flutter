import 'package:api_connect_flutter/cache/cache_helper.dart';
import 'package:api_connect_flutter/core/api/api_consumer.dart';
import 'package:api_connect_flutter/core/api/end_points.dart';
import 'package:api_connect_flutter/core/errors/exceptions.dart';
import 'package:api_connect_flutter/models/sign_in_models.dart';
import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserRepo {
  final ApiConsumer api;

  UserRepo({required this.api});

  Future<Either<String, SignInModels>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      //?send the email and password to the api
      final response = await api.post(
        EndPoints.signIn,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      //?convert the response to SignInModels
      final user = SignInModels.fromJson(response);
      //? decode the token to get the id
      final decodedToken = JwtDecoder.decode(user.token);
      //? save the token and the id in the cache
      CacheHelper().saveData(key: ApiKey.token, value: user.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);
      return right(user);
    } on ServerException catch (e) {
      return left(e.errorModel.errorMessage);
    }
  }


}
