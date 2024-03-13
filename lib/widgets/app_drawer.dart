import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/app/app_routes.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/utils/url.dart';
import 'package:inses_app/view_models/profile_view_model.dart';
import 'package:share/share.dart';

class AppDrawer extends StatefulWidget {
  final VoidCallback logout;
  AppDrawer(this.logout);

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
                color: AppColors.GRAY_4,
              ),
              child: Container(
                child: Column(
                  children: [
                    ImageView(
                      width: 90,
                      asset: 'logo-h1.png',
                      height: 45,
                    ),
                    Content(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      text: ProfileViewModel.name,
                      alignment: Alignment.centerLeft,
                      textAlign: TextAlign.start,
                      textHeight: 1.5,
                      color: AppColors.BLACK,
                      fontfamily: AppFont.FONT,
                      letterSpacing: 1.2,
                      fontSize: AppDimen.TEXT_MEDIUM_1,
                      fontWeight: FontWeight.w500,
                    ),
                    Content(
                      margin: EdgeInsets.only(top: 0, bottom: 10),
                      text: ProfileViewModel.phone,
                      alignment: Alignment.centerLeft,
                      textAlign: TextAlign.start,
                      textHeight: 1.5,
                      color: AppColors.BLACK,
                      fontfamily: AppFont.FONT,
                      letterSpacing: 1.2,
                      fontSize: AppDimen.TEXT_SMALL,
                      fontWeight: FontWeight.w500,
                    ),
                    Content(
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      text: ProfileViewModel.email,
                      alignment: Alignment.centerLeft,
                      textAlign: TextAlign.start,
                      textHeight: 1.5,
                      color: AppColors.BLACK,
                      fontfamily: AppFont.FONT,
                      letterSpacing: 1.2,
                      fontSize: AppDimen.TEXT_SMALL,
                      fontWeight: FontWeight.w500,
                      height: 5.0,
                    ),
                  ],
                ),
              )),
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
              Share.share(
                  'Hello, friend! ${ProfileViewModel.name} invites you to FIXWATT  - On Demand Service app \n ${AppUrl.APP_URL}',
                  subject: '');
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
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: widget.logout,
          ),
        ],
      ),
    );
  }
}
