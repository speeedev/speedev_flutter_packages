import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:speedev_core/src/helpers/logger/logger_helper.dart';
import 'package:speedev_core/src/helpers/speedev_core_functions.dart';

abstract class SDFirebaseCrashlyticsServiceAbstract {
  Future<void> log({required String message});
  Future<void> recordError({String? message, required dynamic error, required StackTrace stackTrace});
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
        SDLoggerHelper().error("Crashlytics log error: $error");
      },
    );
  }

  @override
  Future<void> recordError({
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
        SDLoggerHelper().error("Crashlytics record error: $error");
      },
    );
  }

  @override
  Future<void> setUserIdentifier({required String identifier}) async {
    await safeExecute<void>(
      operation: () async {
        await FirebaseCrashlytics.instance.setUserIdentifier(identifier);
      },
      onError: (error, stackTrace) {
        SDLoggerHelper().error("Crashlytics set user identifier error: $error");
      },
    );
  }

  @override
  Future<void> clearUserIdentifier() async {
    await safeExecute<void>(
      operation: () async {
        await FirebaseCrashlytics.instance.setUserIdentifier("");
      },
      onError: (error, stackTrace) {
        SDLoggerHelper().error("Crashlytics clear user identifier error: $error");
      },
    );
  }
}
