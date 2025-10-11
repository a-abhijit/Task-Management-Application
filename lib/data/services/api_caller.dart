import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/convert_patch.dart';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

class ApiCaller {
  final Logger _logger = Logger();

  Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);

      logRequest(url);

      Response response = await get(uri);

      logResponse(url, response);

      print(response.statusCode);
      print(uri);

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          responseBody: decodedData,
        );
      } else {
        return ApiResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          responseBody: decodedData,
        );
      }
    } catch (e) {
      // Handle network errors, JSON parsing errors, etc.
      return ApiResponse(
        isSuccess: false,
        responseCode: 500,
        responseBody: {'error': e.toString()},
      );
    }
  }
  Future<ApiResponse> postRequest({required String url, Map<String,dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);

      logRequest(url,body: body);

      Response response = await post(uri);

      logResponse(url, response);

      print(response.statusCode);
      print(uri);

      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode==201) {
        return ApiResponse(
          isSuccess: true,
          responseCode: response.statusCode,
          responseBody: decodedData,
        );
      } else {
        return ApiResponse(
          isSuccess: false,
          responseCode: response.statusCode,
          responseBody: decodedData,
        );
      }
    } catch (e) {
      // Handle network errors, JSON parsing errors, etc.
      return ApiResponse(
        isSuccess: false,
        responseCode: 500,
        responseBody: {'error': e.toString()},
      );
    }
  }

  void logRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i('URL:${url}\n'
        'Request body: ${body}');
  }

  void logResponse(String url, Response response) {
    _logger.i(
      'URL:${url}\n'
      'Status Code: ${response.statusCode}\n'
      'Body: ${response.body}',
    );
  }
}

class ApiResponse {
  final bool isSuccess;
  final int responseCode;
  final dynamic responseBody;

  ApiResponse({
    required this.isSuccess,
    required this.responseCode,
    required this.responseBody,
  });
}
