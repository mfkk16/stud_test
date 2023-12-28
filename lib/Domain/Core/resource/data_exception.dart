class DataError implements Exception {
  final String errorMessage;

  DataError(this.errorMessage);

  @override
  String toString() => errorMessage;
}
