import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_default_structure/core/api_client/dio_client.dart';
import 'package:flutter_default_structure/core/api_client/restful_client.dart';
import 'package:flutter_default_structure/core/base_models/base_response_api.dart';
import 'package:flutter_default_structure/core/env/app_env.dart';
import 'package:flutter_default_structure/core/error_handler/failure_case.dart';
import 'package:flutter_default_structure/core/extension/util_extension.dart';
import 'package:flutter_default_structure/models/user_model.dart';
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
  test('dio_client_test: Test dio client post method success', () async {
    dioAdapter.onPost(_endPoint, (server) {
      return server.reply(200, _body);
    }, data: _body);
    final Either<UserModel, Failure> result = await dioClient.post(_endPoint, data: _body, decode: (p0) => UserModel.fromJson(p0));
    expect(result.getLeft(), _testUser);
  });

  test("dio_client_test: Test dio client post method failed from server", () async {
    dioAdapter.onPost(_endPoint, (server) {
      return server.throws(500, dioError);
    }, data: _bodyError);
    final Either<UserModel, Failure> result = await dioClient.post(_endPoint, data: _body, decode: (p0) => UserModel.fromJson(p0));
    expect(
      result.getRight(),
      ServerFailure(message: dioError.message.toString()),
    );
  });

  test("dio_client_test: Model convert function test failure", () async {
    dioAdapter.onPost(_endPoint, (server) {
      return server.reply(200, _bodyMissingData);
    }, data: _body);

    final Either<UserModel, Failure> result = await dioClient.post(_endPoint, data: _body, decode: (p0) => UserModel.fromJson(p0));
    expect(
      result.getRight(),
      ModelFailure(message: dataIsNullExeptionMsg),
    );
  });

  test("dio_client_test: Model convert function fail data", () async {
    dioAdapter.onPost(_endPoint, (server) {
      return server.reply(200, _bodyWrongFormat);
    }, data: _body);

    final Either<UserModel, Failure> result = await dioClient.post(_endPoint, data: _body, decode: (p0) => UserModel.fromJson(p0));
    expect(
      result.getRight(),
      ModelFailure(message: parsingDataExceptionMsg),
    );
  });
}
