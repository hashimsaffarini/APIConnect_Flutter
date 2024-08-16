import 'package:api_connect_flutter/cache/cache_helper.dart';
import 'package:api_connect_flutter/core/api/dio_consumer.dart';
import 'package:api_connect_flutter/cubit/user_cubit.dart';
import 'package:api_connect_flutter/repos/user_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(UserRepo(api: DioConsumer(dio: Dio()))),
      child: const ApiConnect(),
    ),
  );
}

class ApiConnect extends StatelessWidget {
  const ApiConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Connect',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Connect'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Sign In'),
        ),
      ),
    );
  }
}
