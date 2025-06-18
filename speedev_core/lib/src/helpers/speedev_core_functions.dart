import 'package:speedev_core/speedev_core.dart';

Future<void> safeExecute<T>({
  required Future<T> Function() operation,
  Function(dynamic error, StackTrace stackTrace)? onError,
  Function(T data)? onSuccess,
  Function()? onFinally,
}) async {
  try {
    final T response = await operation();
    if (onSuccess != null) {
      onSuccess(response);
    }
  } catch (error, stackTrace) {
    if (onError != null) {
      onError(error, stackTrace);
      SDFirebaseCrashlyticsService().recordCrash(error: error, stackTrace: stackTrace);
    }
  } finally {
    if (onFinally != null) {
      onFinally();
    }
  }
}
