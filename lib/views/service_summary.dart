import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_container.dart';
import 'package:inses_app/comps/line.dart';
import 'package:inses_app/comps/tap_field.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';

class ServiceSummary extends StatefulWidget {

  @override
  _ServiceSummaryState createState() => _ServiceSummaryState();
}

class _ServiceSummaryState extends State<ServiceSummary> {
  StreamController controller;
  int items = 1;

  @override
  void initState() {
    controller = StreamController();
    controller.add(3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App().appBarBack(
        context,
        'Summary of your service',
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
          margin: EdgeInsets.only(left: 15,right: 15,top: 10),
          child:  Row(
            children: [
              Expanded(
                  child: Column(
                    children: [
                      Content(
                        color:AppColors.WHITE_3,
                        text: 'Service Date',
                        alignment: Alignment.centerLeft,
                        textHeight: 2,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w400,
                        fontSize: AppDimen.TEXT_SMALLEST,
                      ),
                      Content(
                        alignment: Alignment.centerLeft,
                        textHeight: 1.5,
                        color:AppColors.BLACK,
                        text: '29 May 2021 01:00 PM',
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLER,
                      ),
                      OnTapField(
                          child: Content(
                            alignment: Alignment.centerLeft,
                            textHeight: 2,
                            color:AppColors.SECONDARY_COLOR,
                            text: 'Change',
                            fontfamily: AppFont.FONT,
                            fontWeight: FontWeight.w500,
                            fontSize: AppDimen.TEXT_SMALLEST,
                          ),
                          onTap: (){

                          }
                      )
                    ],
                  )
              ),
              Line(
                width: 1,
                height: 70,
                color: AppColors.WHITE_1,
                margin: EdgeInsets.only(right: 10, left: 10),
              ),
              Expanded(
                  child: Column(
                    children: [
                      Content(
                        color:AppColors.WHITE_2,
                        text: 'Address',
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLEST,
                        alignment: Alignment.centerLeft,
                        textHeight: 2,
                      ),
                      Content(
                        color:AppColors.BLACK,
                        text: '1/471, Saravanaburam, Allithurai, Trichy',
                        overflow: TextOverflow.ellipsis,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLER,
                        alignment: Alignment.centerLeft,
                        textHeight: 1.5,
                      ),
                      OnTapField(
                          child: Content(
                            color:AppColors.SECONDARY_COLOR,
                            text: 'Change',
                            fontfamily: AppFont.FONT,
                            fontWeight: FontWeight.w500,
                            fontSize: AppDimen.TEXT_SMALLEST,
                            alignment: Alignment.centerLeft,
                            textHeight: 2,
                          ),
                          onTap: (){

                          }
                      )
                    ],
                  )
              )
            ],
          ),
        ),
        Line(
          width: double.infinity,
          height: 5,
          color: AppColors.WHITE_1,
          margin: EdgeInsets.only(top: 20, bottom: 10),
        ),
        Content(
          margin: EdgeInsets.only(top: 10, bottom: 10,left: 15,right: 15),
          color:AppColors.BLACK,
          text: 'My Requirements',
          fontfamily: AppFont.FONT,
          alignment: Alignment.centerLeft,
          fontWeight: FontWeight.w500,
          fontSize: AppDimen.TEXT_SMALL,
        ),
        Content(
          margin: EdgeInsets.only(top: 20, bottom: 10,left: 15,right: 15),
          color:AppColors.BLACK,
          text: 'Convenience Charges',
          fontfamily: AppFont.FONT,
          alignment: Alignment.centerLeft,
          fontWeight: FontWeight.w500,
          fontSize: AppDimen.TEXT_SMALLEST,
        ),
        Content(
          margin: EdgeInsets.only(top: 0, bottom: 10,left: 15,right: 15),
          color:AppColors.BLACK,
          text: '\u20B9 49',
          alignment: Alignment.centerLeft,
          fontfamily: AppFont.FONT,
          fontWeight: FontWeight.w500,
          fontSize: AppDimen.TEXT_SMALL,
        ),
        Line(
          width: double.infinity,
          height: 2,
          color: AppColors.WHITE_1,
          margin: EdgeInsets.only(top: 20, bottom: 10),
        ),
        Container(
          margin: EdgeInsets.only(left: 15,right: 15,top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageContainer(
                margin: EdgeInsets.only(right: 15),
                radius: 5,
                height: 50,
                width: 50,
                url: 'https://waterforfuture.org/wp-content/uploads/2019/11/ways-conserve-water-1068x713-1024x684.jpg',
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Content(
                        padding: EdgeInsets.only(bottom: 12),
                        text: 'Tap Repair',
                        color: AppColors.BLACK,
                        alignment: Alignment.centerLeft,
                        fontfamily: AppFont.FONT,
                        fontSize: AppDimen.TEXT_SMALL,
                        fontWeight: FontWeight.w500,
                      ),
                      Content(
                        text: '\u20B9 100',
                        color: AppColors.BLACK,
                        alignment: Alignment.centerLeft,
                        fontfamily: AppFont.FONT,
                        fontSize: AppDimen.TEXT_SMALL,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  )
              ),
              addItems()
            ],
          ),
        ),
        Line(
          width: double.infinity,
          height: 2,
          color: AppColors.WHITE_1,
          margin: EdgeInsets.only(top: 20, bottom: 10),
        ),
        OnTapField(
            child:
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10,left: 15,right: 15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Content(
                      text: 'Add More Items',
                      color: AppColors.SECONDARY_COLOR,
                      alignment: Alignment.centerLeft,
                      fontfamily: AppFont.FONT,
                      fontSize: AppDimen.TEXT_SMALLEST,
                      fontWeight: FontWeight.w500,
                    ),
                    Icon(Icons.arrow_forward_ios_rounded,color: AppColors.SECONDARY_COLOR,size: 15,)
                  ],
                ),
            ),
            onTap: (){}
        ),
        Line(
          width: double.infinity,
          height: 5,
          color: AppColors.WHITE_1,
          margin: EdgeInsets.only(top: 20, bottom: 10),
        ),
        BorderContainer(
          bgColor: AppColors.WHITE_2,
          margin: EdgeInsets.only(top: 20, bottom: 10,left: 15,right: 15),
          padding: EdgeInsets.only(top: 10, bottom: 10,left: 15,right: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline,color: AppColors.SUCCESS_COLOR,size: 20,),
              Flexible(
                  child: Content(
                    margin: EdgeInsets.only(left: 10),
                    text: 'Free Cancellation and Date Change at anytime',
                    color: AppColors.BLACK_3,
                    alignment: Alignment.centerLeft,
                    fontfamily: AppFont.FONT,
                    fontSize: AppDimen.TEXT_SMALLEST,
                    fontWeight: FontWeight.w500,
                  ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget addItems(){
    return StreamBuilder(
        stream: controller.stream,
        builder: (context,AsyncSnapshot shot){
          if(!shot.hasData || shot.data==0){
            return OnTapField(
                child: BorderContainer(
                  bgColor: AppColors.SECONDARY_COLOR,
                  padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  radius: 4,
                  child: Content(
                    color:AppColors.WHITE,
                    text: 'ADD',
                    fontfamily: AppFont.FONT,
                    fontWeight: FontWeight.w500,
                    fontSize: AppDimen.TEXT_SMALL,
                  ),
                ),
                onTap: (){
                  if(items==0){
                    controller.add(++items);
                  }else{
                    controller.add(items);
                  }
                }
            );
          } else{
            return BorderContainer(
              borderColor: AppColors.WHITE_3,
              radius: 3,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OnTapField(
                      child:Content(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          color:AppColors.SECONDARY_COLOR,
                          text: '-',
                          fontfamily: AppFont.FONT,
                          fontWeight: FontWeight.w500,
                          fontSize: AppDimen.TEXT_SMALL,
                        ),
                      onTap: (){
                        controller.add(--items);
                      }
                  ),
                  Content(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                    width: 70,
                    color:AppColors.BLACK,
                    text: '${shot.data}',
                    fontfamily: AppFont.FONT,
                    fontWeight: FontWeight.w500,
                    fontSize: AppDimen.TEXT_SMALL,
                  ),
                  OnTapField(
                        child: Content(
                          padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          color:AppColors.SECONDARY_COLOR,
                          text: '+',
                          fontfamily: AppFont.FONT,
                          fontWeight: FontWeight.w500,
                          fontSize: AppDimen.TEXT_SMALL,
                        ),
                      onTap: (){
                        controller.add(++items);
                      }
                  ),
                ],
              ),
            );
          }
        }
    );
  }
}
