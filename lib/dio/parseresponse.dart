import 'package:dio/dio.dart';

class ParseResponse {
  static final ParseResponse instance = ParseResponse._();

  ParseResponse._();

  T parseResponse<T>(Response<dynamic> response, T Function(Map<String, dynamic>) fromJson) {
    if (response.statusCode == 200) {
      final dynamicData = response.data;
      if (dynamicData is T) {
        return dynamicData;
      } else if (dynamicData is Map<String, dynamic>) {
        try {
          final parsedData = fromJson(dynamicData);
          return parsedData;
        } catch (e) {
          throw Exception('Failed to parse response');
        }
      }
    }
    throw Exception('Failed to retrieve data');
  }
}