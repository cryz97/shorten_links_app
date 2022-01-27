import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shorten_links_app/models/shorten_url.dart';

class ShortenUrlService {
  static String baseApiUrl = 'https://url-shortener-nu.herokuapp.com/api/alias';
  static Map<String, String> baseHeaders = <String, String>{
    'Content-Type:': 'application/json; charset=UTF-8',
  };

  static Future<ShortenUrl> createUrlAlias(String urlToShort) async {
    final response = await http.post(
      Uri.parse(baseApiUrl),
      headers: baseHeaders,
      body: jsonEncode(<String, String>{
        'url': urlToShort,
      }),
    );

    if (response.statusCode == 200) {
      return ShortenUrl.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to shorten url');
    }
  }
}
