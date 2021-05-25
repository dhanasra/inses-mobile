import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/resources/app_style.dart';
import 'package:inses_app/views/splash.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app_localizations.dart';
import 'app_routes.dart';

class App extends StatelessWidget {
  static final App _instance = App._internal();


  App._internal();
  factory App() {
    return _instance;
  }

  @override
  Widget build(BuildContext context) {
    return getMaterialApp(
        widget: Splash(), title: 'Launch', buildContext: context);
  }

  AppRoutes getAppRoutes() {
    return AppRoutes();
  }

  Widget getMaterialApp(
      {@required Widget widget, String title, BuildContext buildContext}) {



      return MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        home: widget,
        theme: AppStyle.lightTheme(buildContext),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          AppLocalizations.delegate
        ],
        locale: Locale('en', 'US'),
        onGenerateRoute: getAppRoutes().getRoutes,
      );
    }

  Future<dynamic> setNavigation(
      BuildContext context, String appRouteName) async {
    Future.delayed(const Duration(milliseconds: 100), () async {
      final info = await Navigator.push(
          context,
          PageTransition(
              child: getAppRoutes().getWidget(context, appRouteName),
              type: PageTransitionType.fade,
              settings: RouteSettings(name: appRouteName),
              duration: Duration(milliseconds: 0)));

      return info;
    });
  }

  Future<bool> locationPermission() async{
    var status = await Permission.location.status;
    if (status.isDenied) {
      if (await Permission.location.request().isGranted) {
        return true;
      }else{
        if (await Permission.location.isPermanentlyDenied) {
          openAppSettings();
        }
        return false;
      }
    }else{
      return true;
    }
  }

  Color randColor(int val) {
    switch (val) {
      case 0:
        return AppColors.TAMIL;
        break;
      case 1:
        return AppColors.ENGLISH;
        break;
      case 2:
        return AppColors.MATHS;
        break;
      case 3:
        return AppColors.PHYSICS;
        break;
      case 4:
        return AppColors.CHEMISTRY;
        break;
      case 5:
        return AppColors.BOTONY;
        break;
      case 6:
        return AppColors.BOTONY;
        break;
      case 7:
        return AppColors.ZOOLOGY;
        break;
      case 8:
        return AppColors.SCIENCE;
        break;
      case 9:
        return AppColors.GEOGRAPHY;
        break;
      case 10:
        return AppColors.PHYSICS;
        break;
      default:
        return AppColors.GK;
    }
  }


  Color subColor(String subject) {
    switch (subject) {
      case 'Tamil':
        return AppColors.TAMIL;
        break;
      case 'English':
        return AppColors.ENGLISH;
        break;
      case 'Maths':
        return AppColors.MATHS;
        break;
      case 'Physics':
        return AppColors.PHYSICS;
        break;
      case 'Chemistry':
        return AppColors.CHEMISTRY;
        break;
      case 'Biology':
        return AppColors.BOTONY;
        break;
      case 'Botony':
        return AppColors.BOTONY;
        break;
      case 'Zoology':
        return AppColors.ZOOLOGY;
        break;
      case 'Science':
        return AppColors.SCIENCE;
        break;
      case 'Geography':
        return AppColors.GEOGRAPHY;
        break;
      case 'Polytics':
        return AppColors.PHYSICS;
        break;
      case 'GK':
        return AppColors.GK;
        break;
      default:
        return AppColors.GK;
    }
  }

  AppBar appBarBack(BuildContext context,String title,{Widget child}){
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              color: AppColors.WHITE,
              child: IconButton(
                  icon: Icon(
                    LineIcons.arrowLeft,
                    color: AppColors.BLACK_1,
                  ),
                  splashColor: AppColors.WHITE_3,
                  splashRadius: 20,
                  onPressed: () {
                    setBackNavigation(context);
                  }),
            ),
            Content(
              margin: EdgeInsets.only(top: 5,left: 0),
              text: title??'',
              fontSize: AppDimen.TEXT_MEDIUM_1,
              fontWeight: FontWeight.w600,
              fontfamily: AppFont.FONT,
              color: AppColors.BLACK_2,
            )
          ]
      ),
      actions: [
        child??Container()
      ],
    );
  }

  String welcomeText(){
    DateTime now = DateTime.now();

    int timeOfDay = now.hour;

    if(timeOfDay >= 0 && timeOfDay < 12){
      return "Good Morning";
    }else if(timeOfDay >= 12 && timeOfDay < 16){
      return "Good Afternoon";
    }else if(timeOfDay >= 16 && timeOfDay < 21){
      return "Good Evening";
    }else if(timeOfDay >= 21 && timeOfDay < 24){
      return "Good Night";
    }else{
      return '';
    }
  }

  SnackBar snackbar(String text){
    return SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.WHITE,
        content: BorderContainer(
          radius: 20,
          child: Content(
            text: text,
            height: 30,
            fontSize: AppDimen.TEXT_SMALL,
            fontWeight: FontWeight.w500,
            fontfamily: AppFont.FONT,
            color: AppColors.INFO_COLOR,
          ),
        )
    );
  }

  String subImage(String subject){
    switch (subject) {
      case 'Tamil':
        return 'ta.png';
        break;
      case 'English':
        return 'english.png';
        break;
      case 'Maths':
        return 'maths.png';
        break;
      case 'Physics':
        return 'physics.png';
        break;
      case 'Chemistry':
        return 'chemistry.png';
        break;
      case 'Biology':
        return 'botony.png';
        break;
      case 'Botony':
        return 'botony.png';
        break;
      case 'Zoology':
        return 'zoology.png';
        break;
      case 'Science':
        return 'science.png';
        break;
      case 'Geography':
        return 'geography.png';
        break;
      case 'Polytics':
        return 'polytics.png';
        break;
      case 'GK':
        return 'knowledge.png';
        break;
      default:
        return 'knowledge.png';
    }
  }



  void setBackNavigation(BuildContext context) {
    Navigator.pop(context, "inefr");
  }

  void closeApp() {
    if (Platform.isAndroid)
      SystemNavigator.pop();
    else
      exit(0);
  }
}
