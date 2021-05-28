import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/app/app_routes.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/comps/input_field.dart';
import 'package:inses_app/comps/primary_button.dart';
import 'package:inses_app/comps/tap_field.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/view_models/register_view_model.dart';
import 'package:inses_app/widgets/double_color_button.dart';
import 'package:inses_app/widgets/grey_micro.dart';
import 'package:inses_app/widgets/input_item.dart';
import 'package:inses_app/widgets/location_dialogue.dart';
import 'package:inses_app/widgets/or_item.dart';
import 'package:inses_app/widgets/sub_title.dart';

class NameFields extends StatefulWidget {

  @override
  _NameFieldsState createState() => _NameFieldsState();
}

class _NameFieldsState extends State<NameFields> {

  RegisterViewModel _viewmodel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _viewmodel = RegisterViewModel(App());
    super.initState();
    Future.delayed(Duration.zero, () {
      this.showDialogue();
    });
  }

  showDialogue(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
          return LocationDialogue(
            title: "current location",
            description: "Add your current location address",
            text: "Yes",
            onPressed:(){
              _viewmodel.getPosition();
              Navigator.of(context).pop();
            }
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: buildView(),
      )
    );
  }

  Widget buildView(){
    return ListView(
      children: [
        ImageView(
          margin: EdgeInsets.only(left: 20,right: 20,top: 40),
          alignment: Alignment.centerLeft,
          width: 70,asset: 'logo-h2.png',
          height: 40,
        ),
        SubTitle(
          margin: EdgeInsets.only(left: 20,right: 20,top: 10),
          text: 'Add Location',
        ),
        GreyMicro(
          text: 'Book your services at any time with low cost',
          alignment: Alignment.centerLeft,
        ),
        InputField(
            text: 'Address',
            isShadow: false,
            errorMaxLines: 3,
            autoFocus: false,
            margin: EdgeInsets.only(top: 20,left: 20,right: 20),
            controller: _viewmodel.addressController,
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
              child: Icon(Icons.home),
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
        Container(
            margin: EdgeInsets.only(top: 70,left: 20,right: 20),
            alignment: Alignment.center,
            child:Wrap(
                children:[
                  PrimaryButton(
                      text: 'CONTINUE',
                      txtColor: AppColors.WHITE,
                      bgColor: AppColors.PRIMARY_COLOR,
                      fontfamily: AppFont.FONT,
                      fontWeight: FontWeight.w500,
                      fontSize: AppDimen.TEXT_SMALL,
                      radius: 5,
                      onPressed:(){
                        App().setNavigation(context, AppRoutes.APP_HOME_MAIN);
                      }),
                ]
            )
        ),
        Or(),
        Container(
            padding: EdgeInsets.only(left: 15,right: 15),
            margin: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child:Wrap(
                children:[
                  DoubleColorButton(
                      text1: 'Add address later? ',
                      text2: 'Skip',
                      txtColor: AppColors.BLACK,
                      width: 250,
                      fontfamily: AppFont.FONT,
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimen.TEXT_SMALL,
                      onPressed:(){
                        App().setNavigation(context, AppRoutes.APP_HOME_MAIN);
                      })
                ]
            )
        ),
      ],
    );
  }
}
