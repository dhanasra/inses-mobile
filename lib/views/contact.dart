import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/input_field.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/widgets/input_item.dart';
import 'package:inses_app/widgets/mini_title.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App().appBarBack(context, 'Contact'),
      body: Container(
        child: buildView(),
      ),
    );
  }

  Widget buildView(){
    return ListView(
      children: [
        MiniTitle(
          text: 'Message',
        ),
        InputField(
            text: 'Enter your Message',
            isShadow: false,
            errorMaxLines: 3,
            autoFocus: false,
            margin: EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 20),
            // controller: _viewmodel.addressController,
            emptyErrorText: 'Email Id Should not be empty',
            patternErrorText: 'Please Enter a valid Email Id',
            enabledBorderColor: AppColors.WHITE_1,
            enabledBorderWidth: 1.0,
            focusedBorderColor: AppColors.SECONDARY_COLOR,
            hintColor: AppColors.GRAY_2,
            focusedBorderWidth: 1.0,
            inputType: TextInputType.multiline,
            bgColor: AppColors.WHITE,
            prefixIcon: Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: Icon(Icons.message),
            ),
            hoverColor: AppColors.SECONDARY_COLOR,
            radius: 3,
            height: 120,
            minLine: 100,
            maxLine: 100,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            color: AppColors.BLACK,
            fontfamily: AppFont.FONT,
            fontWeight: FontWeight.w500,
            fontSize: AppDimen.TEXT_SMALLER,
            contentPadding: EdgeInsets.only(
                top: 15, bottom: 15, left: 10, right: 10),
            width: 400),
        BorderContainer(
            radius: 4,
            margin: EdgeInsets.only(left: 15,right: 15,top: 30),
            padding: EdgeInsets.only(top: 15,bottom: 15),
            bgColor: AppColors.SECONDARY_COLOR,
            child: Content(
              text: 'SEND',
              color: AppColors.WHITE,
              fontfamily: AppFont.FONT,
              fontSize: AppDimen.TEXT_SMALL,
              fontWeight: FontWeight.w400,
            )
        )
      ],
    );
  }
}
