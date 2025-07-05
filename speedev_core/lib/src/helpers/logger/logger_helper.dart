import 'package:talker/talker.dart';
class SDLoggerHelper {
  SDLoggerHelper._();

  static final SDLoggerHelper _instance = SDLoggerHelper._();

  factory SDLoggerHelper() => _instance;

  late final Talker _talker;
  Talker get talker => _talker;

  Future<void> init() async {
    _talker = Talker();
  }

  void info(String message) {
    _talker.info(message);
  }

  void error(String message) {
    _talker.error(message);
  }

  void warning(String message) {
    _talker.warning(message);
  }

  void debug(String message) {
    _talker.debug(message);
  }
}
