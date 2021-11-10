import 'package:merchant/repository/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesImplementation implements SharedPreferencesRepository {
  late final SharedPreferences prefs;
  SharedPreferencesImplementation() {
    this.init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  dynamic readSharePreferences(Type type, String key) {
    switch (type) {
      case String:
        return getStringValuesSF(key);
      case bool:
        return getBoolValuesSF(key);
      case int:
        return getIntValuesSF(key);
      case double:
        return getDoubleValuesSF(key);
      default:
    }
  }

  Future<String?> getStringValuesSF(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? a = prefs.getString("test");
    print("the value of a");
    print(a);
    return a;
  }

  Future<bool?>? getBoolValuesSF(String key) async {
    return prefs.getBool(key);
  }

  Future<int?>? getIntValuesSF(String key) async {
    return prefs.getInt(key);
  }

  Future<double?>? getDoubleValuesSF(String key) async {
    return prefs.getDouble(key);
  }
}
