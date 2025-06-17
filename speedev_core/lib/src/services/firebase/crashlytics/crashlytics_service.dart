import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:speedev_core/src/helpers/logger/logger_helper.dart';
import 'package:speedev_core/src/helpers/speedev_core_functions.dart';

class SDCrashlyticsService {
  static final SDCrashlyticsService _instance = SDCrashlyticsService._internal();
  factory SDCrashlyticsService() => _instance;

  SDCrashlyticsService._internal();

  Future<void> log(String message) async {
    await safeExecute<void>(
      operation: () async {
        await FirebaseCrashlytics.instance.log(message);
      },
      onError: (error, stackTrace) {
        SDLoggerHelper().error(error);
      },
    );
  }

  Future<void> recordCrash({
    String message = "",
    required dynamic error,
    required StackTrace stackTrace,
  }) async {
    await safeExecute<void>(
      operation: () async {
        await FirebaseCrashlytics.instance.recordError(
          error,
          stackTrace,
          reason: message,
        );
      },
      onError: (error, stackTrace) {
        SDLoggerHelper().error(error);
      },
    );
  }
}
