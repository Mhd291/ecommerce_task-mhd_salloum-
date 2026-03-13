import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'errors/api_exception.dart';
import 'get_exception_from_status_code.dart';
import 'network_info_service.dart';

abstract class ApiService {

  Future<http.Response> get(
      String url, {
        Map<String, String>? headers,
        Map<String, String>? query,
      });

  Future<http.Response> post(
      String url, {
        Map<String, String>? headers,
        dynamic body,
        Map<String, String>? query,
      });

  Future<http.Response> put(
      String url, {
        Map<String, String>? headers,
        dynamic body,
        Map<String, String>? query,
      });

  Future<http.Response> delete(
      String url, {
        Map<String, String>? headers,
        dynamic body,
        Map<String, String>? query,
      });
}

class ApiServiceImpl implements ApiService {

  final http.Client _client;
  final NetworkInfoService _networkInfo;

  ApiServiceImpl(this._client, this._networkInfo);

  static const Duration _timeout = Duration(seconds: 20);
  static const int _retryCount = 2;

  Map<String, String> _defaultHeaders(Map<String, String>? headers) {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json",
      ...?headers,
    };
  }

  Uri _buildUri(String url, Map<String, String>? query) {

    if (query == null) {
      return Uri.parse(url);
    }

    final filteredQuery = Map<String, String>.from(query)
      ..removeWhere((key, value) => value.isEmpty);

    return Uri.parse(url).replace(queryParameters: filteredQuery);
  }

  Future<http.Response> _sendRequest(
      Future<http.Response> Function() request,
      ) async {

    final connected = await _networkInfo.isConnected;

    if (!connected) {
      throw const OfflineException();
    }

    int attempt = 0;

    while (attempt <= _retryCount) {
      try {

        final response = await request().timeout(_timeout);

        handleResponseStatus(response);

        return response;

      } on TimeoutException {

        if (attempt == _retryCount) {
          throw const UnexpectedException(message: "Request timeout");
        }

      } on SocketException {

        if (attempt == _retryCount) {
          throw const OfflineException();
        }

      }

      attempt++;

      await Future.delayed(const Duration(seconds: 1));
    }

    throw const UnexpectedException(message: "Unexpected network error");
  }

  @override
  Future<http.Response> get(
      String url, {
        Map<String, String>? headers,
        Map<String, String>? query,
      }) async {

    final uri = _buildUri(url, query);

    return _sendRequest(() {
      return _client.get(
        uri,
        headers: _defaultHeaders(headers),
      );
    });
  }

  @override
  Future<http.Response> post(
      String url, {
        Map<String, String>? headers,
        dynamic body,
        Map<String, String>? query,
      }) async {

    final uri = _buildUri(url, query);

    return _sendRequest(() {
      return _client.post(
        uri,
        headers: _defaultHeaders(headers),
        body: body != null ? jsonEncode(body) : null,
      );
    });
  }

  @override
  Future<http.Response> put(
      String url, {
        Map<String, String>? headers,
        dynamic body,
        Map<String, String>? query,
      }) async {

    final uri = _buildUri(url, query);

    return _sendRequest(() {
      return _client.put(
        uri,
        headers: _defaultHeaders(headers),
        body: body != null ? jsonEncode(body) : null,
      );
    });
  }

  @override
  Future<http.Response> delete(
      String url, {
        Map<String, String>? headers,
        dynamic body,
        Map<String, String>? query,
      }) async {

    final uri = _buildUri(url, query);

    return _sendRequest(() {
      return _client.delete(
        uri,
        headers: _defaultHeaders(headers),
        body: body != null ? jsonEncode(body) : null,
      );
    });
  }
}