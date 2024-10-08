part of 'user_cubit.dart';

sealed class CubitState {}

final class CubitInitial extends CubitState {}

final class SignInLoading extends CubitState {}

final class SignInSuccess extends CubitState {}

final class SignInFailure extends CubitState {
  SignInFailure(this.error);
  final String error;
}

final class GetUserProfileLoading extends CubitState {}

final class GetUserProfileSuccess extends CubitState {
  GetUserProfileSuccess(this.user);
  final UserModels user;
}

final class GetUserProfileFailure extends CubitState {
  GetUserProfileFailure(this.error);
  final String error;
}
