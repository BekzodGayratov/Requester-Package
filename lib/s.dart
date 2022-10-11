import 'package:dio/dio.dart';

Future<dynamic> update(
    {required String url, Map<String, dynamic>? headers, dynamic data}) async {
  // This method makes put request to the certain server.
  // Only one parametr is required on this method that "url".
  // Other arguments can be also sent.
  // And return certain response. Response may be data, server error message or exceptions.
  // Please check the String value which returned from this method.
  // The data can then be modelled.

  try {
    Response res =
        await Dio().put(url, options: Options(headers: headers), data: data);

    switch (res.statusCode) {
      case 200:
        return res.data;
      default:
        return res.statusMessage.toString();
    }
  } on DioError catch (ex) {
    if (ex.type == DioErrorType.connectTimeout ||
        ex.type == DioErrorType.receiveTimeout ||
        ex.type == DioErrorType.sendTimeout) {
      return ex.message.toString();
    } else {
      return ex.message.toString();
    }
  }
}
