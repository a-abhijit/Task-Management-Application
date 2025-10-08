import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/convert_patch.dart';

import 'package:http/http.dart';

class ApiCaller {
  Future<ApiResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri);
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
