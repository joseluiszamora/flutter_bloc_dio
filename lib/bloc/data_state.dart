part of 'data_bloc.dart';

abstract class DataState {}

final class DataInitial extends DataState {}

final class DataLoading extends DataState {}

final class DataSuccess extends DataState {
  final dynamic data;
  DataSuccess(this.data);
}

class DataError extends DataState {
  final String message;
  final int? statusCode;
  DataError(this.message, this.statusCode);
}
