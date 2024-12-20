import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:example_bloc_dio/error_interceptor.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final Dio _dio;

  DataBloc(this._dio) : super(DataInitial()) {
    _dio.interceptors.add(ErrorInterceptor());

    on<FetchData>((event, emit) async {
      emit(DataLoading());

      try {
        final response = await _dio.get('posts');
        emit(DataSuccess(response.data));
      } catch (e) {
        emit(DataError(e.toString(), null));
      }
    });

    on<DataEvent>((event, emit) {});
  }
}
