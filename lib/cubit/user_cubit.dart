
import 'package:api_connect_flutter/core/api/api_consumer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<CubitState> {
  UserCubit(this.api) : super(CubitInitial());

  final ApiConsumer api;

  signIn() async {
    
  }
}
