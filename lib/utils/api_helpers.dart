import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const baseUrl = "https://api.themoviedb.org/3/";
final apiKey = dotenv.env['API_TOKEN'];
final language = Platform.localeName.split('_')[0];

final $http = Dio(BaseOptions(
  baseUrl: baseUrl,
  headers: {'Accept': 'application/json', 'Authorization': 'Bearer $apiKey'},
  queryParameters: {'language': language},
));

InterceptorsWrapper jsonDecodeInterceptor = InterceptorsWrapper(
  onResponse: (Response response, ResponseInterceptorHandler handler) {
    final contentType = response.headers.value('content-type');
    if (contentType != null && contentType.contains('application/json')) {
      try {
        response.data = jsonDecode(response.data); // Decode the JSON data
      } catch (e) {
        // Handle potential decoding errors
        debugPrint(e.toString());
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Failed to decode JSON response.',
        );
      }
    }
    return handler.next(response);
  },
);
