import 'package:dartz/dartz.dart';
import 'package:flutter_default_structure/core/error_handler/failure_case.dart';

abstract class RestfulClient<T> {
  Future<Either<T, Failure>> get(String url,
      {required Map<String, dynamic> params,
      required T Function(Map<String, dynamic>) decode});
  Future<Either<T, Failure>> post(String url,
      {required Map<String, dynamic> data,
      required T Function(Map<String, dynamic>) decode});
  Future<Either<T, Failure>> put(String url,
      {required Map<String, dynamic> params,
      required T Function(Map<String, dynamic>) decode});
  Future<Either<T, Failure>> delete(String url,
      {required Map<String, dynamic> params,
      required T Function(Map<String, dynamic>) decode});
}
