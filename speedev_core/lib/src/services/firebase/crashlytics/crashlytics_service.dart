import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:speedev_core/src/helpers/logger/logger_helper.dart';
import 'package:speedev_core/src/helpers/speedev_core_functions.dart';

abstract class SDFirebaseCrashlyticsServiceAbstract {
  Future<void> log({required String message});
  Future<void> recordCrash({String? message, required dynamic error, required StackTrace stackTrace});
  Future<void> setUserIdentifier({required String identifier});
  Future<void> clearUserIdentifier();
}

class SDFirebaseCrashlyticsService implements SDFirebaseCrashlyticsServiceAbstract {
  static final SDFirebaseCrashlyticsService _instance = SDFirebaseCrashlyticsService._internal();
  factory SDFirebaseCrashlyticsService() => _instance;

  SDFirebaseCrashlyticsService._internal();

  @override
  Future<void> log({required String message}) async {
    await safeExecute<void>(
      operation: () async {
        await FirebaseCrashlytics.instance.log(message);
      },
      onError: (error, stackTrace) {
        SDLoggerHelper().error(error);
      },
    );
  }

  @override
  Future<void> recordCrash({
    String? message,
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

  @override
  Future<void> setUserIdentifier({required String identifier}) async {
    await safeExecute<void>(
      operation: () async {
        await FirebaseCrashlytics.instance.setUserIdentifier(identifier);
      },
    );
  }

  @override
  Future<void> clearUserIdentifier() async {
    await safeExecute<void>(
      operation: () async {
        await FirebaseCrashlytics.instance.setUserIdentifier("");
      },
    );
  }
}
