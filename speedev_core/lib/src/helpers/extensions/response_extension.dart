import 'package:dio/dio.dart';

extension ResponseExtension on Response {
  bool get isSuccess => statusCode == 200;
  bool get isUnauthorized => statusCode == 401;
  bool get isForbidden => statusCode == 403;
  bool get isNotFound => statusCode == 404;
  bool get isMethodNotAllowed => statusCode == 405;
  bool get isInternalServerError => statusCode == 500;
  bool get isBadRequest => statusCode == 400;
  bool get isUnprocessableEntity => statusCode == 422;
  bool get isTooManyRequests => statusCode == 429;
  bool get isServiceUnavailable => statusCode == 503;
  bool get isGatewayTimeout => statusCode == 504;
  bool get isPreconditionFailed => statusCode == 412;
  bool get isUnsupportedMediaType => statusCode == 415;
}