class SDResult<T> {
  final T? data;
  final String? errorMessage;
  final String? errorCode;
  final bool isSuccess;

  SDResult({this.data, this.errorMessage, this.errorCode, this.isSuccess = false});

  SDResult.success(T data) : this(data: data, isSuccess: true);

  SDResult.error({required String errorMessage, required String errorCode}) : this(errorMessage: errorMessage, errorCode: errorCode, isSuccess: false);
}