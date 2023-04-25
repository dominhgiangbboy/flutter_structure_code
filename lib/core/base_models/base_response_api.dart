class BaseResponseApi<T> {
  final int code;
  final String message;
  final T data;

  BaseResponseApi({required this.code, required this.message, required this.data});

  factory BaseResponseApi.fromJson(Map<String, dynamic> json, dynamic Function(Map<String, dynamic> json) decode) {
    try {
      if (json['data'] == null) {
        throw Exception(dataIsNullExeptionMsg);
      }
      return BaseResponseApi(
        code: json['code'] ?? 0,
        message: json['message'] ?? 0,
        data: decode(json['data']),
      );
    } catch (e) {
      throw Exception(parsingDataExceptionMsg);
    }
  }
}

const String parsingDataExceptionMsg = "Error parsing data";

const String dataIsNullExeptionMsg = "Data is null";
