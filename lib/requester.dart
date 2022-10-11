library requester;

import 'package:dio/dio.dart';

void main() async {
  MakeRequest m = MakeRequest();
  var d = await m.get(url: "https://nbu.uz/uz/exchange-rates/json");
  print(d);
}

// To make request
class MakeRequest {
  Future<dynamic> get(
      {required String url, Map<String, dynamic>? headers}) async {
    // This method makes get request to the certain server.
    // Only one parametr is required on this method that "url".
    // Other arguments can be also sent.
    // And return certain response. Response may be data, server error message or exceptions.
    // Please check the String value which returned from this method.
    // The data can then be modelled.

    try {
      Response res = await Dio().get(url, options: Options(headers: headers));
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
        return "server time out";
      } else if (ex.type == DioErrorType.other) {
        return "no internet";
      } else {
        return ex.message.toString();
      }
    }
  }

  Future<dynamic> post(
      {required String url,
      Map<String, dynamic>? headers,
      dynamic data}) async {
    // This method makes post request to the certain server.
    // Only one parametr is required on this method that "url".
    // Other arguments can be also sent.
    // And return certain response. Response may be data, server error message or exceptions.
    // Please check the String value which returned from this method.
    // The data can then be modelled.

    try {
      Response res =
          await Dio().post(url, options: Options(headers: headers), data: data);
      if (res.statusCode == 200) {
        return res.data;
      } else {
        return res.statusMessage.toString();
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout ||
          ex.type == DioErrorType.receiveTimeout ||
          ex.type == DioErrorType.sendTimeout) {
        return "server time out";
      } else if (ex.type == DioErrorType.other) {
        return "no internet";
      } else {
        return ex.message.toString();
      }
    }
  }

  Future<dynamic> update(
      {required String url,
      Map<String, dynamic>? headers,
      dynamic data}) async {
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
        return "server time out";
      } else if (ex.type == DioErrorType.other) {
        return "no internet";
      } else {
        return ex.message.toString();
      }
    }
  }

  Future<dynamic> delete(
      {required String url,
      Map<String, dynamic>? headers,
      dynamic data}) async {
    // This method makes delete request to the certain server.
    // Only one parametr is required on this method that "url".
    // Other arguments can be also sent.
    // And return certain response. Response may be data, server error message or exceptions.
    // Please check the String value which returned from this method.
    // The data can then be modelled.

    try {
      Response res = await Dio()
          .delete(url, options: Options(headers: headers), data: data);
      if (res.statusCode == 200) {
        return res.data;
      } else {
        return res.statusMessage.toString();
      }
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout ||
          ex.type == DioErrorType.receiveTimeout ||
          ex.type == DioErrorType.sendTimeout) {
        return "server time out";
      } else if (ex.type == DioErrorType.other) {
        return "no internet";
      } else {
        return ex.message.toString();
      }
    }
  }
}
