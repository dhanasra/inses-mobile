import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_container.dart';
import 'package:inses_app/comps/line.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/widgets/review_scroll_card.dart';
import 'package:inses_app/widgets/sub.dart';

class ServiceSubItem extends StatelessWidget {
  final String img;
  final String service;
  ServiceSubItem({this.img,this.service});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageContainer(
                width: 40,
                height: 40,
                radius: 100,
                url: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fHBsdW1iaW5nfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
              ),
              Expanded(
                  child: Content(
                    margin: EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 15),
                    text: 'Pipe fitting / replacing',
                    alignment: Alignment.centerLeft,
                    textAlign: TextAlign.start,
                    textHeight: 1.5,
                    color: AppColors.BLACK,
                    fontfamily: AppFont.FONT,
                    letterSpacing: 0.5,
                    fontSize: AppDimen.TEXT_SMALLEST,
                    fontWeight: FontWeight.w500,
                  )
              ),
              Icon(
                Icons.arrow_right
              )
            ],
          ),
          Line(width: double.infinity, height: 2,color: AppColors.WHITE_1,margin: EdgeInsets.only(left: 10,right: 10,top: 15,bottom: 15),),

        ],
      )
    );
  }
}