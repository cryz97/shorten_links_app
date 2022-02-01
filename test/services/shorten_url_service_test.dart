import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shorten_links_app/models/shorten_url.dart';
import 'package:shorten_links_app/services/shorten_url_service.dart';

import 'shorten_url_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  String baseApiExpected = 'https://url-shortener-nu.herokuapp.com/api/alias';
  Map<String, String> baseHeadersExpected = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  test("Base URL test", () {
    expect(ShortenUrlService.baseApiUrl, equals(baseApiExpected));
  });

  test("Content type Json test", () {
    expect(ShortenUrlService.baseHeaders, equals(baseHeadersExpected));
  });

  test("Alias POST 200 test", () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.parse(baseApiExpected),
      headers: baseHeadersExpected,
      body: jsonEncode(<String, String>{
        'url': 'www.google.com',
      }),
    )).thenAnswer((_) async => http.Response(
        '{"alias": "01234", "_links": '
        '{ "self": "www.google.com", "short": "/01234" }}',
        200));

    expect(await ShortenUrlService.createUrlAlias('www.google.com', mockClient),
        isA<ShortenUrl>());
  });

  test('Alias POST 400 test', () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.parse(baseApiExpected),
      headers: baseHeadersExpected,
      body: jsonEncode(<String, String>{
        'url': 'www.google.com',
      }),
    )).thenAnswer((_) async => http.Response('Invalid Request 400', 400));

    expect(ShortenUrlService.createUrlAlias('www.google.com', mockClient),
        throwsA(isA<HttpException>()));
  });

  test('Alias POST 401 / 403 test', () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.parse(baseApiExpected),
      headers: baseHeadersExpected,
      body: jsonEncode(<String, String>{
        'url': 'www.google.com',
      }),
    )).thenAnswer((_) async => http.Response('Unauthorized 401', 401));

    expect(ShortenUrlService.createUrlAlias('www.google.com', mockClient),
        throwsA(isA<HttpException>()));
  });

  test('Alias POST 415 test', () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.parse(baseApiExpected),
      headers: baseHeadersExpected,
      body: jsonEncode(<String, String>{
        'url': 'www.google.com',
      }),
    )).thenAnswer(
        (_) async => http.Response('Unsupported Media Type 415', 415));

    expect(ShortenUrlService.createUrlAlias('www.google.com', mockClient),
        throwsA(isA<HttpException>()));
  });

  test('Alias POST 500 test', () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.parse(baseApiExpected),
      headers: baseHeadersExpected,
      body: jsonEncode(<String, String>{
        'url': 'www.google.com',
      }),
    )).thenAnswer((_) async => http.Response('500', 500));

    expect(ShortenUrlService.createUrlAlias('www.google.com', mockClient),
        throwsA(isA<HttpException>()));
  });

  test('Alias POST No internet connection test', () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.parse(baseApiExpected),
      headers: baseHeadersExpected,
      body: jsonEncode(<String, String>{
        'url': 'www.google.com',
      }),
    )).thenAnswer(
        (_) async => throw const SocketException('No internet connection'));

    try {
      await ShortenUrlService.createUrlAlias('www.google.com', mockClient);
    } catch (e) {
      expect(e, isA<SocketException>());
    }
  });
}
