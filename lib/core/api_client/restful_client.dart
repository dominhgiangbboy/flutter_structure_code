import 'package:dartz/dartz.dart';
import 'package:flutter_default_structure/core/error_handler/failure_case.dart';

abstract class RestfulClient<T> {
  Future<T> get(String url);
  Future<Either<T, Failure>> post(String url, {required Map<String, dynamic> data, required T Function(Map<String, dynamic>) decode});
  Future<T> put(String url, Map<String, dynamic> body);
  Future<T> delete(String url);
}
