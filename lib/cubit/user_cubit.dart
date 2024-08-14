import 'package:api_connect_flutter/cache/cache_helper.dart';
import 'package:api_connect_flutter/core/api/api_consumer.dart';
import 'package:api_connect_flutter/core/api/end_points.dart';
import 'package:api_connect_flutter/core/errors/exceptions.dart';
import 'package:api_connect_flutter/models/sign_in_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'user_state.dart';

class UserCubit extends Cubit<CubitState> {
  UserCubit(this.api) : super(CubitInitial());

  final ApiConsumer api;
  SignInModels? user;

  signIn() async {
    try {
      emit(SignInLoading());
      //?send the email and password to the api
      final response = await api.post(
        EndPoints.signIn,
        data: {
          ApiKey.email: 'example@gmail.com',
          ApiKey.password: 'example123',
        },
      );
      //?convert the response to SignInModels
      user = SignInModels.fromJson(response);
      //? decode the token to get the id
      final decodedToken = JwtDecoder.decode(user!.token);
      //? save the token and the id in the cache
      CacheHelper().saveData(key: ApiKey.token, value: user!.token);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);

      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(e.errorModel.errorMessage));
    }
  }
}
