// This file provides a stub for web platform where sqflite is not available
class Database {}

Future<String> getDatabasesPath() async {
  throw UnsupportedError('getDatabasesPath is not supported on web');
}

Future<Database> openDatabase(
  String path, {
  int? version,
  Future<void> Function(Database, int)? onCreate,
}) async {
  throw UnsupportedError('openDatabase is not supported on web');
}
