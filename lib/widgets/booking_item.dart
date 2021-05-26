import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_container.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';

class BookingItem extends StatefulWidget {

  @override
  _BookingItemState createState() => _BookingItemState();
}

class _BookingItemState extends State<BookingItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 10),
      elevation: 4,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              children: [
                Wrap(
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
                  ],
                ),
                Content(
                  padding: EdgeInsets.only(top: 8,bottom: 8),
                  alignment: Alignment.centerRight,
                  text: '\u20B9 2000',
                  color: AppColors.BLACK_3,
                  fontfamily: AppFont.FONT,
                  fontSize: AppDimen.TEXT_SMALLEST,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 5,right: 5),
              margin: EdgeInsets.only(top: 20,bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ImageContainer(
                    radius: 50,
                    height: 60,
                    width: 60,
                    bgColor: AppColors.WHITE_1,
                    asset: 'plumber.jpeg',
                  ),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: Column(
                          children: [
                            Content(
                              padding: EdgeInsets.only(top: 8,bottom: 8),
                              text: 'Plumbing Service',
                              color: AppColors.BLACK,
                              alignment: Alignment.centerLeft,
                              fontfamily: AppFont.FONT,
                              fontSize: AppDimen.TEXT_SMALL,
                              fontWeight: FontWeight.w600,
                            ),
                            Content(
                              padding: EdgeInsets.only(top: 8,bottom: 8),
                              text: 'pipe fitting or replacing',
                              color: AppColors.BLACK_3,
                              alignment: Alignment.centerLeft,
                              fontfamily: AppFont.FONT,
                              fontSize: AppDimen.TEXT_SMALLER,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child:
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.access_time,size: 15,color: AppColors.GRAY,),
                        Content(
                          margin: EdgeInsets.only(left: 5),
                          text: '12 May, 11.30 pm',
                          color: AppColors.GRAY,
                          fontfamily: AppFont.FONT,
                          fontSize: AppDimen.TEXT_SMALLEST,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.monetization_on,size: 15,color: AppColors.GRAY,),
                          Content(
                            padding: EdgeInsets.only(left: 5),
                            text: 'Cash',
                            color: AppColors.GRAY,
                            fontfamily: AppFont.FONT,
                            fontSize: AppDimen.TEXT_SMALLEST,
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
