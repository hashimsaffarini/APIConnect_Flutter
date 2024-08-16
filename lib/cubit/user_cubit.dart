import 'package:api_connect_flutter/models/user_models.dart';
import 'package:api_connect_flutter/repos/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<CubitState> {
  UserCubit(this.userRepo) : super(CubitInitial());

  final UserRepo userRepo;

  signIn() async {
    emit(SignInLoading());
    final response = await userRepo.signIn(
      email: 'email',
      password: 'password',
    );
    response.fold(
      (error) => emit(SignInFailure(error)),
      (user) => emit(SignInSuccess()),
    );
  }

  getUserProfile() async {}
}
