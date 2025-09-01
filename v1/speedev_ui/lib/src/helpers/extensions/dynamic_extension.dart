extension DynamicExtension on dynamic {
  bool get isNull => this == null;
  bool get isNotNull => this != null;

  Future<void> ifNull(Future<void> Function() onNull) async {
    if (isNull) {
      await onNull();
    }
  }

  Future<void> ifNotNull(Future<void> Function() onNotNull) async {
    if (isNotNull) {
      await onNotNull();
    }
  }
}