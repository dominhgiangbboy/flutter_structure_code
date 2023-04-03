import 'package:dio/dio.dart';
import 'package:flutter_default_structure/core/api_client/dio_client.dart';
import 'package:flutter_default_structure/core/api_client/restful_client.dart';
import 'package:flutter_default_structure/core/env/app_env.dart';
import 'package:flutter_default_structure/domain/entities/user_entity.dart';
import 'package:flutter_default_structure/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';

const Map<String, dynamic> _body = {'id': '1', 'name': '2', 'email': '3'};

const Map<String, dynamic> _bodyError = {'Error': 'Error'};
Map<String, dynamic> _errorReturn = {'message': 'error'};
const UserModel _testUser = UserModel('1', '2', '3');
const String _endPoint = '/test';
@GenerateMocks([Dio])
void main() {
  final Environment environment = choosingEnvironment(Flavor.dev);
  late DioAdapter dioAdapter;
  late Dio dio;
  late RestfulClient dioClient;
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: environment.baseUrl));
    dioAdapter = DioAdapter(dio: dio);
    dioClient = DioClient(dio);
  });

  final RequestOptions _requestOptions = RequestOptions(path: _endPoint);
  DioError dioError = DioError(
    requestOptions: _requestOptions,
    response: Response(statusCode: 500, data: _errorReturn, requestOptions: _requestOptions),
  );
  test('dio_client_test: Test dio client post method ', () async {
    dioAdapter.onPost(_endPoint, (server) {
      return server.reply(200, _testUser);
    }, data: _body);
    dioAdapter.onPost(_endPoint, (server) {
      return server.throws(500, dioError);
    }, data: _bodyError);
    Response<UserModel> res = await dio.post<UserModel>(_endPoint, data: _body);
    print(res.data);
    dio.post<User>(_endPoint, data: _body).then((res) {
      print(res.data);
      expect(res, throwsA(isA<DioError>()));
    });

    // final response = await dioClient.post(_endPoint, _body);
    // expect(response, _body);
  });
}
