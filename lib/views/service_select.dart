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
import 'package:inses_app/widgets/mini_card_item.dart';
import 'package:inses_app/widgets/mini_title.dart';
import 'package:inses_app/widgets/promise_item.dart';
import 'package:inses_app/widgets/review_scroll_card.dart';
import 'package:inses_app/widgets/service_sub_item.dart';
import 'package:inses_app/widgets/sub.dart';

class ServiceSelect extends StatefulWidget {

  @override
  _ServiceSelectState createState() => _ServiceSelectState();
}

class _ServiceSelectState extends State<ServiceSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App().appBarBack(
          context,
          'Select your need',
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
                      text: 'Best Plumbing Services in Madurai',
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
                    )
                  ],
                ),
              ),
              Card(
                elevation: 4,
                margin: EdgeInsets.only(top: 250,left: 10,right: 10),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      MiniTitle(text: 'Select what you need',margin: EdgeInsets.only(bottom: 20),),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6,
                          itemBuilder: (context,index){
                            return ServiceSubItem();
                          }
                      ),
                    ],
                  )
                ),
              )
            ],
          ),
        Content(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(15),
          text: 'Plumbin Service Includes',
          alignment: Alignment.centerLeft,
          textAlign: TextAlign.start,
          textHeight: 1.5,
          color: AppColors.BLACK,
          bgColor: AppColors.WHITE_1,
          fontfamily: AppFont.FONT,
          letterSpacing: 0.5,
          fontSize: AppDimen.TEXT_H7,
          fontWeight: FontWeight.w500,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30),
          padding: EdgeInsets.only(top: 10),
          color: AppColors.WHITE_1,
          child: SizedBox(
            height: 130.0,
            child: ListView(scrollDirection: Axis.horizontal,
              children: [1,2,3,4].map((e) {return MiniCardItem();}).toList(),
            ),
          ),
        ),
        Sub(
          text: 'How it works',
        ),
        PromiseItem(
          img: Icon(
            Icons.book_rounded,
            color: AppColors.TAMIL,
            size: 30,
          ),
          text1: 'Select The Service You Need',
          text2: 'Get lowest priced for plumbing service',
        ),
        PromiseItem(
          img: Icon(
            Icons.payment,
            color: AppColors.SUCCESS_COLOR,
            size: 30,
          ),
          text1: 'Pay Booking Advance',
          text2: 'Make advance payment to book your service or ontime cash',
        ),
        PromiseItem(
          img: Icon(
            Icons.check_circle,
            color: AppColors.INFO_COLOR,
            size: 30,
          ),
          text1: 'Get Hassle Free Service Delivery',
          text2:
          'Inses arrives at your doorstep to provide service',
        ),
        Line(
          width: double.infinity,
          height: 10,
          color: AppColors.WHITE_1,
          margin: EdgeInsets.only(top: 20, bottom: 10),
        ),
        Sub(
          text: 'INSES Promises',
        ),
        PromiseItem(
          img: Icon(
            Icons.monetization_on,
            color: AppColors.TAMIL,
            size: 30,
          ),
          text1: 'Lowest Prices',
          text2: 'No surprises at the time of service, no hidden costs',
        ),
        PromiseItem(
          img: Icon(
            Icons.verified_user_rounded,
            color: AppColors.SUCCESS_COLOR,
            size: 30,
          ),
          text1: 'Free Cancellation & Reschedule',
          text2: 'Book now, cancel or change anytime later. No questions asked',
        ),
        PromiseItem(
          img: Icon(
            Icons.verified,
            color: AppColors.INFO_COLOR,
            size: 30,
          ),
          text1: 'Top Quality Trusted Professionals',
          text2:
          'Best-in-class service professionals are chosen after stringent quality checks',
        ),
        Line(
          width: double.infinity,
          height: 10,
          color: AppColors.WHITE_1,
          margin: EdgeInsets.only(top: 20, bottom: 10),
        ),
        Sub(
          text: 'Customer stories',
        ),
        ReviewScrollCard()
      ],
    );
  }
}
