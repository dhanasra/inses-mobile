import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/app/app_routes.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/widgets/sub.dart';
import 'package:inses_app/widgets/sub_title.dart';

class AppDrawer extends StatefulWidget {

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.SECONDARY_COLOR,
            ),
            child: Container(
              child: Column(
                children: [
                  ImageView(width: 100,asset: 'logo-h2.png',),
                  Content(
                    margin: EdgeInsets.only(top: 20,bottom: 10),
                    text: 'Dhana sekaran',
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    textHeight: 1.5,
                    color: AppColors.WHITE,
                    fontfamily: AppFont.FONT,
                    letterSpacing: 1.2,
                    fontSize: AppDimen.TEXT_MEDIUM_1,
                    fontWeight: FontWeight.w500,
                  ),
                  Content(
                    margin: EdgeInsets.only(top: 0,bottom: 10),
                    text: '8056384773',
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    textHeight: 1.5,
                    color: AppColors.WHITE,
                    fontfamily: AppFont.FONT,
                    letterSpacing: 1.2,
                    fontSize: AppDimen.TEXT_SMALL,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            )
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              App().setNavigation(context, AppRoutes.APP_HOME_MAIN);
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Invite Friends'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contact us'),
            onTap: () {
              App().setNavigation(context, AppRoutes.APP_CONTACT);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About us'),
            onTap: () {
              App().setNavigation(context, AppRoutes.APP_ABOUT);
            },
          ),
        ],
      ),
    );
  }
}
