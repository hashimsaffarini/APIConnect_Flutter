import 'package:api_connect_flutter/core/api/api_consumer.dart';
import 'package:api_connect_flutter/core/api/end_points.dart';
import 'package:api_connect_flutter/core/errors/exceptions.dart';
import 'package:api_connect_flutter/models/sign_in_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<CubitState> {
  UserCubit(this.api) : super(CubitInitial());

  final ApiConsumer api;
  SignInModels? user;

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoints.signIn,
        data: {
          ApiKey.email: 'example@gmail.com',
          ApiKey.password: 'example123',
        },
      );
      user = SignInModels.fromJson(response);
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(e.errorModel.errorMessage));
    }
  }
}
