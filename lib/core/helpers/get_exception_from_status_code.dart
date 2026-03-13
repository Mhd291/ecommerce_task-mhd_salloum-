import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'errors/exception.dart';

Unit handleResponseStatus(Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      return unit;

    case 400:
    case 422:
      throw BadRequestException(
        message: _extractMessage(response.body),
      );

    case 401:
      throw  UnAuthenticatedException();

    case 403:
      throw  UnAuthorizedException();

    case 404:
      throw NotFoundException();

    case 500:
      throw  InternalServerErrorException();

    default:
      throw  UnexpectedException();
  }
}

String _extractMessage(String body) {
  try {
    final decoded = json.decode(body);

    if (decoded is Map && decoded.containsKey('message')) {
      return decoded['message'];
    }

    return "Bad request";
  } catch (_) {
    return "Bad request";
  }
}