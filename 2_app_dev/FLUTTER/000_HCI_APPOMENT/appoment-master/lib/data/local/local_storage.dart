import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  late SharedPreferences _ref;

  static final LocalStorage _singleton = LocalStorage._();

  factory LocalStorage() => _singleton;

  Future<void> initialize() async {
    _ref = await SharedPreferences.getInstance();
  }

  void set(String key, Object? value) {
    if (value is String) {
      _ref.setString(key, value);
    } else if (value is int) {
      _ref.setInt(key, value);
    } else if (value is double) {
      _ref.setDouble(key, value);
    } else if (value == null) {
      _ref.remove(key);
    }
  }

  Object? get(String key) {
    return _ref.get(key);
  }

  String? getAsString(String key) {
    return _ref.getString(key);
  }

  int? getAsInt(String key) {
    return _ref.getInt(key);
  }

  double? getAsDouble(String key) {
    return _ref.getDouble(key);
  }
}
