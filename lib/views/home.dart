import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/comps/line.dart';
import 'package:inses_app/model/service.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/widgets/promise_item.dart';
import 'package:inses_app/widgets/review_scroll_card.dart';
import 'package:inses_app/widgets/scroll_card.dart';
import 'package:inses_app/widgets/search_input_field.dart';
import 'package:inses_app/widgets/service_item.dart';
import 'package:inses_app/widgets/sub.dart';
import 'package:inses_app/widgets/sub_title.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<ServiceModel> services;

  @override
  void initState() {
    services = [
      ServiceModel(name: 'Electrical',img: 'https://inses.in/wp-content/uploads/2021/03/electrical.png'),
      ServiceModel(name: 'Installation',img: 'https://inses.in/wp-content/uploads/2021/03/solar-installation.png'),
      ServiceModel(name: 'New Connection',img: 'https://inses.in/wp-content/uploads/2021/03/new-connection.png'),
      ServiceModel(name: 'Painting',img: 'https://inses.in/wp-content/uploads/2021/03/new-painting.png'),
      ServiceModel(name: 'Plumbing',img: 'https://inses.in/wp-content/uploads/2021/03/tap.png'),
      ServiceModel(name: 'LED Tv',img: 'https://inses.in/wp-content/uploads/2021/03/led-tv.png'),
      ServiceModel(name: 'Maintenance',img: 'https://inses.in/wp-content/uploads/2021/03/maintenance.png'),
    ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          color: AppColors.SECONDARY_COLOR,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.menu,color: AppColors.WHITE_1,),
                    ),
                    Expanded(
                        child: Row(
                          children: [
                            ImageView(
                              width: 90,
                              asset: 'logo-h2.png',
                            ),
                            Content(
                              padding: EdgeInsets.only(left: 10,top: 10),
                              alignment: Alignment.centerLeft,
                              text: 'Online services',
                              fontfamily: AppFont.FONT,
                              color: AppColors.WHITE_3,
                              fontWeight: FontWeight.w400,
                              fontSize: AppDimen.TEXT_SMALLEST,
                            )
                          ],
                        )
                    )
                  ],
                ),
              ),
              Line(width:double.infinity, height: 3,color: AppColors.WHITE_1,),
            ],
          ),
        ),
      ),
      body: Container(
        child: buildView(),
      ),
    );
  }

  Widget buildView(){
    return ListView(
      children: [
        Container(
          color: AppColors.WHITE,
          padding: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Content(
                          alignment: Alignment.centerRight,
                          text: '24',
                          fontfamily: AppFont.FONT,
                          color: AppColors.PRIMARY_COLOR,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimen.TEXT_H4,
                        ),
                        Content(
                          alignment: Alignment.centerRight,
                          text: ' x ',
                          fontfamily: AppFont.FONT,
                          color: AppColors.BLACK,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimen.TEXT_SMALL,
                        ),
                        Content(
                          alignment: Alignment.centerRight,
                          text: '7',
                          fontfamily: AppFont.FONT,
                          color: AppColors.PRIMARY_COLOR,
                          fontWeight: FontWeight.w600,
                          fontSize: AppDimen.TEXT_H4,
                        ),
                        Content(
                          padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerRight,
                          text: 'Available',
                          fontfamily: AppFont.FONT,
                          color: AppColors.BLACK,
                          fontWeight: FontWeight.w400,
                          fontSize: AppDimen.TEXT_SMALLEST,
                        )
                      ],
                    ),
                  )
              ),
              Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: BorderContainer(
                      radius: 20,
                      padding: EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                      borderColor: AppColors.GRAY,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                              Icons.phone,
                              size: 18,
                              color: AppColors.BLACK,
                          ),
                          Content(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerRight,
                            text: '8056384773',
                            fontfamily: AppFont.FONT,
                            color: AppColors.BLACK,
                            fontWeight: FontWeight.w400,
                            fontSize: AppDimen.TEXT_SMALLEST,
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
        SearchInputField(),
        ScrollCard(),
        Line(width: double.infinity, height: 10,color: AppColors.WHITE_1,margin: EdgeInsets.only(top: 20,bottom: 10),),
        Sub(text: 'Services',),
        Container(
            margin: EdgeInsets.only(top:10),
            padding: EdgeInsets.only(left: 5,right: 5),
            decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                AppColors.WHITE_1,
                AppColors.WHITE,
              ], radius: 0.85, focal: Alignment.center),
            ),
            child:    GridView.builder(
              shrinkWrap: true,
              itemCount: services.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
              ),
              itemBuilder: (context,index){
                return ServiceItem(serviceModel: services[index],);
              },
            )
        ),
        Line(width: double.infinity, height: 10,color: AppColors.WHITE_1,margin: EdgeInsets.only(top: 20,bottom: 10),),
        Sub(text: 'INSES Promises',),
        PromiseItem(
          img: Icon(Icons.monetization_on,color: AppColors.TAMIL,size: 30,),
          text1: 'Lowest Prices',
          text2: 'No surprises at the time of service, no hidden costs',
        ),
        PromiseItem(
          img: Icon(Icons.verified_user_rounded,color: AppColors.SUCCESS_COLOR,size: 30,),
          text1: 'Free Cancellation & Reschedule',
          text2: 'Book now, cancel or change anytime later. No questions asked',
        ),
        PromiseItem(
          img: Icon(Icons.verified,color: AppColors.INFO_COLOR,size: 30,),
          text1: 'Top Quality Trusted Professionals',
          text2: 'Best-in-class service professionals are chosen after stringent quality checks',
        ),
        Line(width: double.infinity, height: 10,color: AppColors.WHITE_1,margin: EdgeInsets.only(top: 20,bottom: 10),),
        Sub(text: 'Customer stories',),
        ReviewScrollCard()
      ],
    );
  }
}
