import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shorten_links_app/models/shorten_url.dart';

class ShortenUrlService {
  static String baseApiUrl = 'https://url-shortener-nu.herokuapp.com/api/alias';
  static Map<String, String> baseHeaders = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  static Future<ShortenUrl> createUrlAlias(
      String urlToShort, http.Client httpClient) async {
    http.Response response;

    try {
      response = await httpClient.post(
        Uri.parse(baseApiUrl),
        headers: baseHeaders,
        body: jsonEncode(<String, String>{
          'url': urlToShort,
        }),
      );
      final responseBody = response.body;
      final responseCode = response.statusCode;
      switch (responseCode) {
        case 200:
          return ShortenUrl.fromJson(jsonDecode(responseBody));
        case 400:
          throw HttpException('Invalid Request : $responseBody');
        case 401:
        case 403:
          throw HttpException('Unauthorized : $responseBody');
        case 415:
          throw HttpException('Unsupported Media Type : $responseBody');
        case 500:
        default:
          throw HttpException('$responseCode : $responseBody');
      }
    } on SocketException {
      throw const SocketException('No internet connection');
    }
  }
}
