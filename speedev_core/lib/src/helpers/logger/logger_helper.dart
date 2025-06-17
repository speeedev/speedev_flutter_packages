import 'package:logger/web.dart';

class SDLoggerHelper {
  SDLoggerHelper._();

  static final SDLoggerHelper _instance = SDLoggerHelper._();

  factory SDLoggerHelper() => _instance;

  late final Logger _logger;

  Future<void> init() async {
    _logger = Logger();
  }

  void info(String message) {
    _logger.i(message);
  }

  void error(String message) {
    _logger.e(message);
  }

  void warning(String message) {
    _logger.w(message);
  }

  void debug(String message) {
    _logger.d(message);
  }
}
