class SDResult<T> {
  final T? data;
  final String? errorMessage;
  final bool isSuccess;

  SDResult({this.data, this.errorMessage, this.isSuccess = false});
}