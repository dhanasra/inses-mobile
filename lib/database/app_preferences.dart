import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class AppPreferences {
  // Constants for Preference-Value's data-type
  static const String PREF_TYPE_BOOL = "BOOL";
  static const String PREF_TYPE_INTEGER = "INTEGER";
  static const String PREF_TYPE_DOUBLE = "DOUBLE";
  static const String PREF_TYPE_STRING = "STRING";

  //-------------------------------------------------------------------- Singleton ----------------------------------------------------------------------
  // Final static instance of class initialized by private constructor
  static final AppPreferences _instance = AppPreferences._internal();
  // Factory Constructor
  factory AppPreferences() => _instance;

  AppPreferences._internal();

  //User Info

  Future<void> setFirstName({@required String firstName}) => setPreference(
      prefName: AppConstants.F_NAME,
      prefType: PREF_TYPE_STRING,
      prefValue: firstName);
  Future<void> setLastName({@required String lastName}) => setPreference(
      prefName: AppConstants.L_NAME,
      prefType: PREF_TYPE_STRING,
      prefValue: lastName);
  Future<void> setGender({@required String gender}) => setPreference(
      prefName: AppConstants.GENDER,
      prefType: PREF_TYPE_STRING,
      prefValue: gender);
  Future<void> setEmail({@required String email}) => setPreference(
      prefName: AppConstants.EMAIL,
      prefType: PREF_TYPE_STRING,
      prefValue: email);
  Future<void> setImage({@required String image}) => setPreference(
      prefName: AppConstants.IMAGE,
      prefType: PREF_TYPE_STRING,
      prefValue: image);
  Future<void> setTheme({@required String theme}) => setPreference(
      prefName: AppConstants.THEME,
      prefType: PREF_TYPE_STRING,
      prefValue: theme);

  Future<void> setClass({@required String std}) => setPreference(
      prefName: AppConstants.STD, prefType: PREF_TYPE_STRING, prefValue: std);
  Future<void> setExam({@required String exam}) => setPreference(
      prefName: AppConstants.EXAM, prefType: PREF_TYPE_STRING, prefValue: exam);
  Future<void> setPhoneNumber({@required String phone}) => setPreference(
      prefName: AppConstants.PHONE_NUMBER,
      prefType: PREF_TYPE_STRING,
      prefValue: phone);
  Future<void> setCity({@required String city}) => setPreference(
      prefName: AppConstants.CITY,
      prefType: PREF_TYPE_STRING,
      prefValue: city);
  Future<void> setInstitute({@required String status}) => setPreference(
      prefName: AppConstants.INSTITUTE,
      prefType: PREF_TYPE_STRING,
      prefValue: status);

  Future<dynamic> getTheme() async =>
      await _getPreference(prefName: AppConstants.THEME) ?? 'LIGHT';
  Future<dynamic> getFirstName() async =>
      await _getPreference(prefName: AppConstants.F_NAME) ?? "Fellower!";
  Future<dynamic> getLastName() async =>
      await _getPreference(prefName: AppConstants.L_NAME) ??
      AppConstants.LOGGED_OUT;
  Future<dynamic> getImage() async =>
      await _getPreference(prefName: AppConstants.IMAGE) ??
      AppConstants.DEFAULT_IMAGE_URL;
  Future<dynamic> getGender() async =>
      await _getPreference(prefName: AppConstants.GENDER) ??
      AppConstants.LOGGED_OUT;
  Future<dynamic> getClass() async =>
      await _getPreference(prefName: AppConstants.STD) ??
      AppConstants.LOGGED_OUT;
  Future<dynamic> getEmail() async =>
      await _getPreference(prefName: AppConstants.EMAIL) ??
      AppConstants.LOGGED_OUT;
  Future<dynamic> getExam() async =>
      await _getPreference(prefName: AppConstants.EXAM) ?? AppConstants.NEET;
  Future<dynamic> getPhoneNumber() async =>
      await _getPreference(prefName: AppConstants.PHONE_NUMBER) ??
      AppConstants.LOGGED_OUT;
  Future<dynamic> getCity() async =>
      await _getPreference(prefName: AppConstants.CITY) ??
      AppConstants.LOGGED_OUT;
  Future<dynamic> getInstitute() async =>
      await _getPreference(prefName: AppConstants.INSTITUTE) ??
      AppConstants.LOGGED_OUT;

  Future<void> setLoginStatus({@required String status}) => setPreference(
      prefName: AppConstants.LOGIN_STATUS,
      prefType: PREF_TYPE_STRING,
      prefValue: status);
  Future<void> setLanguageCode({@required String code}) => setPreference(
      prefName: AppConstants.LANGUAGE_CODE,
      prefType: PREF_TYPE_STRING,
      prefValue: code);

  Future<dynamic> getLoginStatus() async =>
      await _getPreference(prefName: AppConstants.LOGIN_STATUS) ??
      AppConstants.LOGGED_OUT;
  Future<dynamic> getLanguageCode() async =>
      await _getPreference(prefName: AppConstants.LANGUAGE_CODE) ?? 'ta';

  // Check value for NULL. If NULL provide default value as FALSE.

  //--------------------------------------------------- Private Preference Methods ----------------------------------------------------
  /// Set Preference Method -> void
  /// @param -> @required prefName -> String
  ///        -> @required prefValue -> dynamic
  ///        -> @required prefType -> String
  /// @usage -> This is a generalized method to set preferences with required Preference-Name(Key) with Preference-Value(Value) and Preference-Value's data-type.
  Future<void> setPreference(
      {@required String prefName,
      @required dynamic prefValue,
      @required String prefType}) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    switch (prefType) {
      // prefType is bool
      case PREF_TYPE_BOOL:
        {
          _preferences.setBool(prefName, prefValue);
          break;
        }
      // prefType is int
      case PREF_TYPE_INTEGER:
        {
          _preferences.setInt(prefName, prefValue);
          break;
        }
      // prefType is double
      case PREF_TYPE_DOUBLE:
        {
          _preferences.setDouble(prefName, prefValue);
          break;
        }
      // prefType is String
      case PREF_TYPE_STRING:
        {
          _preferences.setString(prefName, prefValue);
          break;
        }
    }
  }

  /// Get Preference Method -> Future<dynamic>
  /// @param -> @required prefName -> String
  /// @usage -> Returns Preference-Value for given Preference-Name
  Future<dynamic> _getPreference({@required prefName}) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.get(prefName);
  }
}
