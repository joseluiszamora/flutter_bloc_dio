import 'package:dio/dio.dart';
import 'package:example_bloc_dio/network_exception.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NetworkException(
          message: 'Error de tiempo de espera en la conexión',
          error: err,
        );
      case DioExceptionType.connectionError:
        throw NetworkException(
          message: 'No hay conexión a internet',
          error: err,
        );
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw NetworkException(
              message: 'Solicitud incorrecta',
              statusCode: 400,
              error: err.response?.data,
            );
          case 401:
            throw NetworkException(
              message: 'No autorizado',
              statusCode: 401,
              error: err.response?.data,
            );
          case 403:
            throw NetworkException(
              message: 'Acceso prohibido',
              statusCode: 403,
              error: err.response?.data,
            );
          case 404:
            throw NetworkException(
              message: 'Recurso no encontrado',
              statusCode: 404,
              error: err.response?.data,
            );
          case 500:
            throw NetworkException(
              message: 'Error interno del servidor',
              statusCode: 500,
              error: err.response?.data,
            );
          default:
            throw NetworkException(
              message: 'Error desconocido',
              statusCode: err.response?.statusCode,
              error: err.response?.data,
            );
        }
      default:
        throw NetworkException(
          message: 'Error desconocido',
          error: err,
        );
    }
  }
}
