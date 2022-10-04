import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences._internal();

  factory AppPreferences() {
    return _appPreferences;
  }

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  saveStringPreference(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  saveBoolPreference(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  saveIntPreference(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  saveDoublePreference(String key, double value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setDouble(key, value);
  }

  saveListPreference(String key, List<String> value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setStringList(key, value);
  }

  getStringPreference(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }

  getBoolPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  getIntPreference(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key) ?? -1;
  }

  getDoublePreference(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getDouble(key) ?? -1;
  }

  getListPreference(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList(key) ?? '';
  }

  // void clearPreferences() async {
  //   final SharedPreferences prefs = await _prefs;
  //   prefs.setString(Constants.userName, '');
  //   prefs.setString(Constants.firstName, '');
  //   prefs.setString(Constants.lastName, '');
  //   prefs.setString(Constants.contactNumber, '');
  //   prefs.setString(Constants.accessToken, '');
  //   prefs.setBool(Constants.rememberMe, false);
  //   prefs.setBool(Constants.doneOnBoarding, false);
  //   prefs.setBool(Constants.firstLogin, false);
  //   prefs.setInt(Constants.userId, -1);
  //   prefs.setString(Constants.userEmail, '');
  //   prefs.setString(Constants.userRole, '');
  //   prefs.setString(Constants.profileImage, '');
  // }

  // Future savePreferences(String token, String id, String firstname, String lastname, String userName,
  //     String email, String contact, String? loginTime, String profileImage) async {
  //   appPreferences.saveBoolPreference(Constants.rememberMe, true);
  //   appPreferences.saveBoolPreference(Constants.firstLogin, loginTime!=null);
  //   appPreferences.saveStringPreference(Constants.userId, id);
  //   appPreferences.saveStringPreference(Constants.accessToken, token);
  //   appPreferences.saveStringPreference(Constants.firstName, firstname);
  //   appPreferences.saveStringPreference(Constants.lastName, lastname);
  //   appPreferences.saveStringPreference(Constants.userName, userName);
  //   appPreferences.saveStringPreference(Constants.userEmail, email);
  //   appPreferences.saveStringPreference(Constants.contactNumber, contact);
  //   appPreferences.saveStringPreference(Constants.profileImage, profileImage);
  // }

  static final AppPreferences _appPreferences = AppPreferences._internal();
}

AppPreferences appPreferences = AppPreferences();
