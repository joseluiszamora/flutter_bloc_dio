import 'package:example_bloc_dio/api_client.dart';
import 'package:example_bloc_dio/bloc/data_bloc.dart';
import 'package:example_bloc_dio/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => DataBloc(ApiClient.createDio()),
        child: const HomePge(),
      ),
    );
  }
}
