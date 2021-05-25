import 'package:flutter/cupertino.dart';
import 'package:inses_app/views/home_main.dart';
import 'package:inses_app/views/login.dart';
import 'package:inses_app/views/name_fields.dart';
import 'package:inses_app/views/register.dart';

class AppRoutes {
  //Authentication pages
  static const String APP_SPLASH = '/splash';
  static const String APP_NAME_FIELDS = '/name_fields';
  static const String APP_REGISTER = '/register';
  static const String APP_FORGOT_PASSWORD = '/forgot_password';
  static const String APP_LOGIN = '/login';
  static const String APP_AUTH_LOAD = '/auth_load';
  static const String APP_SPLASH_LOAD = '/splash_load';


  static const String APP_HOME_MAIN = '/home_main';

  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case APP_LOGIN:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Login(),
            fullscreenDialog: true,
          );
        }
      case APP_REGISTER:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Register(),
            fullscreenDialog: true,
          );
        }
      case APP_NAME_FIELDS:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => NameFields(),
            fullscreenDialog: true,
          );
        }
      case APP_HOME_MAIN:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => HomeMain(),
            fullscreenDialog: true,
          );
        }
      default:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Container(),
            fullscreenDialog: true,
          );
        }
    }
  }

  getWidget(BuildContext context, String appRouteName) {
    switch (appRouteName) {
      case APP_LOGIN:
        {
          return Login();
        }
      case APP_REGISTER:
        {
          return Register();
        }
      case APP_NAME_FIELDS:
        {
          return NameFields();
        }
      case APP_HOME_MAIN:
        {
          return HomeMain();
        }
      default:
        {
          return Container();
        }
    }
  }
}
