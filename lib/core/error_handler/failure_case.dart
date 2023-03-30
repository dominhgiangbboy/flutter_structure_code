// ignore_for_file: constant_identifier_names

import 'package:equatable/equatable.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String STORAGE_FAILURE_MESSAGE = 'Storage Failure';
const String MODEL_FAILURE_MESSAGE = 'Model Failure';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({this.message = SERVER_FAILURE_MESSAGE});
}

class StorageFailure extends Failure {
  final String message;
  StorageFailure({this.message = STORAGE_FAILURE_MESSAGE});
}

class ModelFailure extends Failure {
  final String message;
  ModelFailure({this.message = MODEL_FAILURE_MESSAGE});
}
