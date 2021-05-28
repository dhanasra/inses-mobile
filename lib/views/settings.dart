import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/widgets/input_item.dart';
import 'package:inses_app/widgets/mini_title.dart';

class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App().appBarBack(
        context,
        'Settings',
      ),
      body: Container(
        child: buildView(),
      ),
    );
  }

  Widget buildView(){
    return ListView(
      children: [
        MiniTitle(
          text: 'Update Phone Number',
        ),
        InputItem(
          // focusNode: _viewmodel.phoneFocus,
          // controller: _viewmodel.phoneController,
          prefixIcon: Icon(Icons.phone),
          autoFocus: false,
          margin: EdgeInsets.only(top: 20,left: 15,right: 15),
          text: 'Phone number',
          emptyError: 'Phone number should not be empty',
          lengthError: 'Enter a valid phone number',
          patternError: 'Enter a valid phone number',
          minLength: 10,
          inputType: TextInputType.phone,
          isObscurred: false,
          regExp:(RegExp(r'[0-9]')),
        ),
        BorderContainer(
            radius: 4,
            margin: EdgeInsets.only(left: 15,right: 15,top: 30),
            padding: EdgeInsets.only(left: 5,right: 5,top: 15,bottom: 15),
            bgColor: AppColors.SECONDARY_COLOR,
            child: Content(
              text: 'UPDATE',
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
