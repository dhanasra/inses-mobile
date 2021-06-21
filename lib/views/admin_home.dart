import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/app/app_routes.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/comps/line.dart';
import 'package:inses_app/comps/tap_field.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/utils/expandable_container.dart';
import 'package:inses_app/view_models/edit_view_model.dart';
import 'package:inses_app/view_models/home_view_model.dart';
import 'package:inses_app/widgets/admin_item.dart';
import 'package:inses_app/widgets/app_drawer.dart';
import 'package:inses_app/widgets/profile_option.dart';
import 'package:inses_app/widgets/service_item.dart';
import 'package:inses_app/widgets/sub.dart';

class AdminHome extends StatefulWidget {

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  HomeViewModel viewModel;


  @override
  void initState() {
    viewModel = HomeViewModel(App());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(logout),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          color: AppColors.SECONDARY_COLOR,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OnTapField(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.menu,
                            color: AppColors.WHITE_1,
                          ),
                        ),
                        onTap: (){
                          _scaffoldKey.currentState.openDrawer();
                        }
                    ),
                    Expanded(
                        child: Row(
                          children: [
                            ImageView(
                              width: 90,
                              asset: 'logo-h2.png',
                            ),
                            Content(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              alignment: Alignment.centerLeft,
                              text: 'Online services',
                              fontfamily: AppFont.FONT,
                              color: AppColors.WHITE_3,
                              fontWeight: FontWeight.w400,
                              fontSize: AppDimen.TEXT_SMALLEST,
                            )
                          ],
                        ))
                  ],
                ),
              ),
              Line(
                width: double.infinity,
                height: 3,
                color: AppColors.WHITE_1,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: buildView(),
      ),
    );
  }

  Widget buildView() {

    return ListView(
        children: [
          Sub(
            text: 'Add / Edit',
          ),
          AdminItem(
            name: 'Category',
            icon: Icons.category_outlined,
            onPressed: (){
              EditViewModel.type = 0;
              App().setNavigation(context, AppRoutes.APP_SERVICE_LIST);
            },
          ),
          AdminItem(
            name: 'Service',
            icon: Icons.cleaning_services,
            onPressed: (){
              EditViewModel.type = 1;
              App().setNavigation(context, AppRoutes.APP_SERVICE_LIST);
            },
          ),
          AdminItem(
            name: 'Offer',
            icon: Icons.local_offer_outlined,
            onPressed: (){
              EditViewModel.type = 2;
              App().setNavigation(context, AppRoutes.APP_SERVICE_LIST);
            },
          ),
        ]
    );
  }

  void logout(){

  }
}
