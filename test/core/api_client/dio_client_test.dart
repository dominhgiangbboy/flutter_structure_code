import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quickcare_employee_app/core/api_client/dio_client.dart';
import 'package:quickcare_employee_app/core/api_client/restful_client.dart';
import 'package:quickcare_employee_app/core/base_models/base_response_api.dart';
import 'package:quickcare_employee_app/core/env/app_env.dart';
import 'package:quickcare_employee_app/core/error_handler/failure_case.dart';
import 'package:quickcare_employee_app/core/extension/util_extension.dart';
import 'package:quickcare_employee_app/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';

const Map<String, dynamic> _body = {
  'code': 200,
  'message': 'success',
  'data': {'id': '1', 'name': '2', 'email': '3'}
};
const Map<String, dynamic> _bodyMissingMessage = {
  'code': 200,
  'data': {'id': '1', 'name': '2', 'email': '3'}
};
const Map<String, dynamic> _bodyWrongFormat = {
  'message': 'success',
  'code': 200,
  'data': {'id': null, 'name': '2', 'email': '3'}
};

const Map<String, dynamic> _bodyMissingData = {
  'code': 200,
  'message': 'success',
};
const Map<String, dynamic> _bodyError = {'Error': 'Error'};
Map<String, dynamic> _errorReturn = {'message': 'error'};
const UserModel _testUser = UserModel('1', '2', '3');
const String _endPoint = '/test';
@GenerateMocks([Dio])
void main() {
  final Environment environment = choosingEnvironment(Flavor.dev);
  late DioAdapter dioAdapter;
  late Dio dio;
  late RestfulClient<UserModel> dioClient;
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: environment.baseUrl));
    dioAdapter = DioAdapter(dio: dio);
    dioClient = DioClient<UserModel>(dio);
  });

  final RequestOptions requestOptions = RequestOptions(path: _endPoint);
  DioError dioError = DioError(
    requestOptions: requestOptions,
    response: Response(statusCode: 500, data: _errorReturn, requestOptions: requestOptions),
  );
  group("dio_client_test: Post", () {
    test('Success model', () async {
      dioAdapter.onPost(_endPoint, (server) {
        return server.reply(200, _body);
      }, data: _body);
      final Either<UserModel, Failure> result = await dioClient.post(_endPoint, data: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(result.getLeft(), _testUser);
    });

    test("Failure from client", () async {
      dioAdapter.onPost(_endPoint, (server) {
        return server.throws(500, dioError);
      }, data: _bodyError);
      final Either<UserModel, Failure> result = await dioClient.post(_endPoint, data: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ServerFailure(message: dioError.message.toString()),
      );
    });

    test("Model convert function test failure", () async {
      dioAdapter.onPost(_endPoint, (server) {
        return server.reply(200, _bodyMissingData);
      }, data: _body);

      final Either<UserModel, Failure> result = await dioClient.post(_endPoint, data: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ModelFailure(message: dataIsNullExeptionMsg),
      );
    });

    test("Model convert function fail data", () async {
      dioAdapter.onPost(_endPoint, (server) {
        return server.reply(200, _bodyWrongFormat);
      }, data: _body);

      final Either<UserModel, Failure> result = await dioClient.post(_endPoint, data: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ModelFailure(message: parsingDataExceptionMsg),
      );
    });
  });

  group("dio_client_test: Get", () {
    test('Success model', () async {
      dioAdapter.onGet(_endPoint, (server) {
        return server.reply(200, _body);
      }, queryParameters: _body);
      final Either<UserModel, Failure> result = await dioClient.get(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(result.getLeft(), _testUser);
    });

    test("Failure from server", () async {
      dioAdapter.onGet(_endPoint, (server) {
        return server.throws(500, dioError);
      }, queryParameters: _body);
      final Either<UserModel, Failure> result = await dioClient.get(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ServerFailure(message: dioError.message.toString()),
      );
    });

    test("Model convert function test failure", () async {
      dioAdapter.onGet(_endPoint, (server) {
        return server.reply(200, _bodyMissingData);
      }, queryParameters: _body);

      final Either<UserModel, Failure> result = await dioClient.get(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ModelFailure(message: dataIsNullExeptionMsg),
      );
    });

    test("Model convert function fail data", () async {
      dioAdapter.onGet(_endPoint, (server) {
        return server.reply(200, _bodyWrongFormat);
      }, queryParameters: _body);
      final Either<UserModel, Failure> result = await dioClient.get(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ModelFailure(message: parsingDataExceptionMsg),
      );
    });
  });

  group("dio_client_test: Put", () {
    test('Success model', () async {
      dioAdapter.onPut(_endPoint, (server) {
        return server.reply(200, _body);
      }, queryParameters: _body);
      final Either<UserModel, Failure> result = await dioClient.put(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(result.getLeft(), _testUser);
    });

    test("Failure from server", () async {
      dioAdapter.onPut(_endPoint, (server) {
        return server.throws(500, dioError);
      }, queryParameters: _body);
      final Either<UserModel, Failure> result = await dioClient.put(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ServerFailure(message: dioError.message.toString()),
      );
    });

    test("Model convert function test failure", () async {
      dioAdapter.onPut(_endPoint, (server) {
        return server.reply(200, _bodyMissingData);
      }, queryParameters: _body);

      final Either<UserModel, Failure> result = await dioClient.put(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ModelFailure(message: dataIsNullExeptionMsg),
      );
    });

    test("Model convert function fail data", () async {
      dioAdapter.onPut(_endPoint, (server) {
        return server.reply(200, _bodyWrongFormat);
      }, queryParameters: _body);
      final Either<UserModel, Failure> result = await dioClient.put(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ModelFailure(message: parsingDataExceptionMsg),
      );
    });
  });
  group("dio_client_test: Delete", () {
    test('Success model', () async {
      dioAdapter.onDelete(_endPoint, (server) {
        return server.reply(200, _body);
      }, queryParameters: _body);
      final Either<UserModel, Failure> result = await dioClient.delete(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(result.getLeft(), _testUser);
    });

    test("Failure from server", () async {
      dioAdapter.onDelete(_endPoint, (server) {
        return server.throws(500, dioError);
      }, queryParameters: _body);
      final Either<UserModel, Failure> result = await dioClient.delete(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ServerFailure(message: dioError.message.toString()),
      );
    });

    test("Model convert function test failure", () async {
      dioAdapter.onDelete(_endPoint, (server) {
        return server.reply(200, _bodyMissingData);
      }, queryParameters: _body);

      final Either<UserModel, Failure> result = await dioClient.delete(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ModelFailure(message: dataIsNullExeptionMsg),
      );
    });

    test("Model convert function fail data", () async {
      dioAdapter.onDelete(_endPoint, (server) {
        return server.reply(200, _bodyWrongFormat);
      }, queryParameters: _body);
      final Either<UserModel, Failure> result = await dioClient.delete(_endPoint, params: _body, decode: (p0) => UserModel.fromJson(p0));
      expect(
        result.getRight(),
        ModelFailure(message: parsingDataExceptionMsg),
      );
    });
  });
}
