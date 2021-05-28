import 'package:flutter/cupertino.dart';
import 'package:inses_app/views/about.dart';
import 'package:inses_app/views/address_select.dart';
import 'package:inses_app/views/booking_desc.dart';
import 'package:inses_app/views/bookings.dart';
import 'package:inses_app/views/contact.dart';
import 'package:inses_app/views/date_time_select.dart';
import 'package:inses_app/views/home_main.dart';
import 'package:inses_app/views/login.dart';
import 'package:inses_app/views/name_fields.dart';
import 'package:inses_app/views/payment_history.dart';
import 'package:inses_app/views/profile.dart';
import 'package:inses_app/views/register.dart';
import 'package:inses_app/views/service_add_cart.dart';
import 'package:inses_app/views/service_select.dart';
import 'package:inses_app/views/service_summary.dart';
import 'package:inses_app/views/settings.dart';

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

  static const String APP_BOOKING = '/booking';

  static const String APP_BOOKING_INFO = '/booking_info';

  static const String APP_PROFILE = '/profile';
  static const String APP_SETTINGS = '/settings';
  static const String APP_CONTACT = '/contact';
  static const String APP_ABOUT = '/about';
  static const String APP_PAYMENT_HISTORY = '/payment_history';

  static const String APP_ORDER_FLOW_1 = '/order_flow_1';
  static const String APP_ORDER_FLOW_2 = '/order_flow_2';
  static const String APP_ORDER_FLOW_3 = '/order_flow_3';
  static const String APP_ORDER_FLOW_4 = '/order_flow_4';
  static const String APP_ORDER_FLOW_5 = '/order_flow_5';

  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case APP_PAYMENT_HISTORY:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => PaymentHistory(),
            fullscreenDialog: true,
          );
        }
      case APP_CONTACT:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Contact(),
            fullscreenDialog: true,
          );
        }
      case APP_ABOUT:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => About(),
            fullscreenDialog: true,
          );
        }
      case APP_SETTINGS:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Settings(),
            fullscreenDialog: true,
          );
        }
      case APP_PROFILE:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Profile(),
            fullscreenDialog: true,
          );
        }
      case APP_BOOKING_INFO:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => BookingDesc(),
            fullscreenDialog: true,
          );
        }
      case APP_BOOKING:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Bookings(),
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
      case APP_ORDER_FLOW_1:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => ServiceSelect(),
            fullscreenDialog: true,
          );
        }
      case APP_ORDER_FLOW_2:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => ServiceAddCart(),
            fullscreenDialog: true,
          );
        }
      case APP_ORDER_FLOW_3:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => AddressSelect(),
            fullscreenDialog: true,
          );
        }
      case APP_ORDER_FLOW_4:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => DateTimeSelect(),
            fullscreenDialog: true,
          );
        }
      case APP_ORDER_FLOW_5:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => ServiceSummary(),
            fullscreenDialog: true,
          );
        }
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
      case APP_PAYMENT_HISTORY:
        {
          return PaymentHistory();
        }
      case APP_CONTACT:
        {
          return Contact();
        }
      case APP_ABOUT:
        {
          return About();
        }
      case APP_SETTINGS:
        {
          return Settings();
        }
      case APP_PROFILE:
        {
          return Profile();
        }
      case APP_BOOKING_INFO:
        {
          return BookingDesc();
        }
      case APP_BOOKING:
        {
          return Bookings();
        }
      case APP_ORDER_FLOW_1:
        {
          return ServiceSelect();
        }
      case APP_ORDER_FLOW_2:
        {
          return ServiceAddCart();
        }
      case APP_ORDER_FLOW_3:
        {
          return AddressSelect();
        }
      case APP_ORDER_FLOW_4:
        {
          return DateTimeSelect();
        }
      case APP_ORDER_FLOW_5:
        {
          return ServiceSummary();
        }
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
