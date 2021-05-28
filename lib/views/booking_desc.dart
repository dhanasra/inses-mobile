import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_container.dart';
import 'package:inses_app/comps/line.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/widgets/mini_title.dart';
import 'package:inses_app/widgets/service_sub_item.dart';

class BookingDesc extends StatefulWidget {

  @override
  _BookingDescState createState() => _BookingDescState();
}

class _BookingDescState extends State<BookingDesc> {

  int type;

  @override
  void initState() {
    type = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: App().appBarBack(
        context,
        'Tap Service',
      ),
      body: Container(
        child: buildView(),
      ),
    );
  }

  Widget buildView(){
    return ListView(
      children: [
        Stack(
          children: [
            ImageContainer(
              height: 300,
              width: double.infinity,
              radius: 0,
              url: 'https://images.unsplash.com/photo-1596394723269-b2cbca4e6313?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHBsdW1iaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
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
                                    color: AppColors.SUCCESS_COLOR_EXTRA_LIGHT,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppDimen.TEXT_H4,
                                  ),
                                  Content(
                                    alignment: Alignment.centerRight,
                                    text: ' x ',
                                    fontfamily: AppFont.FONT,
                                    color: AppColors.WHITE,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppDimen.TEXT_SMALL,
                                  ),
                                  Content(
                                    alignment: Alignment.centerRight,
                                    text: '7',
                                    fontfamily: AppFont.FONT,
                                    color: AppColors.SUCCESS_COLOR_EXTRA_LIGHT,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppDimen.TEXT_H4,
                                  ),
                                  Content(
                                    padding: EdgeInsets.only(left: 10),
                                    alignment: Alignment.centerRight,
                                    text: 'Available',
                                    fontfamily: AppFont.FONT,
                                    color: AppColors.WHITE,
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppDimen.TEXT_SMALLEST,
                                  )
                                ],
                              ),
                            )),
                        Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: BorderContainer(
                                radius: 20,
                                padding:
                                EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                                borderColor: AppColors.WHITE,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      size: 18,
                                      color: AppColors.WHITE,
                                    ),
                                    Content(
                                      padding: EdgeInsets.only(left: 10),
                                      alignment: Alignment.centerRight,
                                      text: '8056384773',
                                      fontfamily: AppFont.FONT,
                                      color: AppColors.WHITE,
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppDimen.TEXT_SMALLEST,
                                    )
                                  ],
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Content(
                    padding: EdgeInsets.only(top: 20,left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    fontfamily: AppFont.FONT,
                    textHeight: 1.5,
                    letterSpacing: 1,
                    text: 'Plumbing Service',
                    color: AppColors.WHITE,
                    fontWeight: FontWeight.w600,
                    fontSize: AppDimen.TEXT_H1,
                  ),
                  Content(
                    padding: EdgeInsets.only(top: 10,left: 15,right: 15),
                    alignment: Alignment.centerLeft,
                    fontfamily: AppFont.FONT,
                    textHeight: 1.5,
                    text: 'Get lowest prices for plumbing services in Madurai',
                    color: AppColors.WHITE_1,
                    fontWeight: FontWeight.w400,
                    fontSize: AppDimen.TEXT_SMALL,
                  ),
                ],
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.only(top: 250,left: 10,right: 10),
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BorderContainer(
                          radius: 4,
                          padding: EdgeInsets.only(left: 5,right: 5,top: 8,bottom: 8),
                          bgColor: AppColors.SUCCESS_COLOR,
                          child: Content(
                            width: 80,
                            text: 'Completed',
                            color: AppColors.WHITE,
                            fontfamily: AppFont.FONT,
                            fontSize: AppDimen.TEXT_MINI,
                            fontWeight: FontWeight.w500,
                          )
                      ),
                      Content(
                        color:AppColors.GRAY,
                        text: 'Service',
                        alignment: Alignment.centerLeft,
                        textHeight: 2,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w400,
                        fontSize: AppDimen.TEXT_SMALLEST,
                      ),
                      Content(
                        alignment: Alignment.centerLeft,
                        textHeight: 1.5,
                        margin: EdgeInsets.only(top: 5),
                        color:AppColors.BLACK,
                        text: '1 Tap repair service',
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLER,
                      ),
                      Content(
                        margin: EdgeInsets.only(top: 15),
                        color:AppColors.GRAY,
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
                        margin: EdgeInsets.only(top: 5),
                        color:AppColors.BLACK,
                        text: '29 May 2021 01:00 PM',
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLER,
                      ),
                      Content(
                        margin: EdgeInsets.only(top: 15),
                        color:AppColors.GRAY,
                        text: 'Address',
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLEST,
                        alignment: Alignment.centerLeft,
                        textHeight: 2,
                      ),
                      Content(
                        color:AppColors.BLACK,
                        margin: EdgeInsets.only(top: 5),
                        text: '1/471, Saravanaburam, Allithurai, Trichy',
                        overflow: TextOverflow.ellipsis,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLER,
                        alignment: Alignment.centerLeft,
                        textHeight: 1.5,
                      ),
                      Content(
                        margin: EdgeInsets.only(top: 15),
                        color:AppColors.GRAY,
                        text: 'Amount',
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLEST,
                        alignment: Alignment.centerLeft,
                        textHeight: 2,
                      ),
                      Content(
                        color:AppColors.BLACK,
                        text: '\u20B9 2000',
                        margin: EdgeInsets.only(top: 5),
                        overflow: TextOverflow.ellipsis,
                        fontfamily: AppFont.FONT,
                        fontWeight: FontWeight.w500,
                        fontSize: AppDimen.TEXT_SMALLER,
                        alignment: Alignment.centerLeft,
                        textHeight: 1.5,
                      ),
                      type==0?BorderContainer(
                          radius: 4,
                          margin: EdgeInsets.only(top: 30),
                          padding: EdgeInsets.only(left: 5,right: 5,top: 15,bottom: 15),
                          bgColor: AppColors.SECONDARY_COLOR,
                          child: Content(
                            text: 'PAY \u20B9 2000',
                            color: AppColors.WHITE,
                            fontfamily: AppFont.FONT,
                            fontSize: AppDimen.TEXT_SMALL,
                            fontWeight: FontWeight.w400,
                          )
                      ):type==1?
                      BorderContainer(
                          radius: 4,
                          margin: EdgeInsets.only(top: 30),
                          padding: EdgeInsets.only(left: 5,right: 5,top: 15,bottom: 15),
                          bgColor: AppColors.SECONDARY_COLOR,
                          child: Content(
                            text: 'REVIEW',
                            color: AppColors.WHITE,
                            fontfamily: AppFont.FONT,
                            fontSize: AppDimen.TEXT_SMALL,
                            fontWeight: FontWeight.w400,
                          )
                      ):Container()
                    ],
                  )
              ),
            )
          ],
        ),
      ],
    );
  }
}
