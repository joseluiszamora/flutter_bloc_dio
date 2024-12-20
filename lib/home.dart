import 'package:example_bloc_dio/bloc/data_bloc.dart';
import 'package:example_bloc_dio/data_view.dart';
import 'package:example_bloc_dio/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePge extends StatelessWidget {
  const HomePge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc + Dio'),
      ),
      body: BlocBuilder<DataBloc, DataState>(
        builder: (context, state) {
          return switch (state) {
            DataInitial() => Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Welcome'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        context.read<DataBloc>().add(FetchData());
                      },
                      child: const Text("Press"))
                ],
              )),
            DataLoading() => const CircularProgressIndicator(),
            DataSuccess(data: final data) => DataView(data: data),
            DataError(message: final message) => ErrorView(
                message: message,
                onRetry: () => context.read<DataBloc>().add(FetchData()),
              ),
            DataState() => throw UnimplementedError(),
          };
        },
      ),
    );
  }
}
