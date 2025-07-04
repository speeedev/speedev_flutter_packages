Future<void> safeExecute<T>({
  required Future<T> Function() operation,
  Function(dynamic error, StackTrace stackTrace)? onError,
  Function(T data)? onSuccess,
  Function()? onFinally,
}) async {
  try {
    final T response = await operation();
    onSuccess?.call(response);
  } catch (error, stackTrace) {
    onError?.call(error, stackTrace);
  } finally {
    onFinally?.call();
  }
}
