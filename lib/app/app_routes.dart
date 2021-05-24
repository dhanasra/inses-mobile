import 'package:flutter/cupertino.dart';

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
      default:
        {
          return Container();
        }
    }
  }
}
