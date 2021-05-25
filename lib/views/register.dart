import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/app/app_routes.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/comps/primary_button.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/view_models/register_view_model.dart';
import 'package:inses_app/widgets/double_color_button.dart';
import 'package:inses_app/widgets/grey_micro.dart';
import 'package:inses_app/widgets/input_item.dart';
import 'package:inses_app/widgets/or_item.dart';
import 'package:inses_app/widgets/sub_title.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  RegisterViewModel _viewmodel;

  @override
  void initState() {
    _viewmodel = RegisterViewModel(App());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  buildView(),
      ),
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
          text: 'Create Account',
        ),
        GreyMicro(
          text: 'Book your services at any time with low cost',
          alignment: Alignment.centerLeft,
        ),
        InputItem(
          focusNode: _viewmodel.phoneFocus,
          controller: _viewmodel.phoneController,
          autoFocus: true,
          prefixIcon: Icon(Icons.phone),
          margin: EdgeInsets.only(top: 30,left: 20,right: 20),
          text: 'Phone number',
          emptyError: 'Phone number should not be empty',
          lengthError: 'Enter a valid phone number',
          patternError: 'Enter a valid email id',
          minLength: 10,
          inputType: TextInputType.phone,
          isObscurred: false,
          regExp:(RegExp(r'[0-9]')),
        ),
        InputItem(
          focusNode: _viewmodel.passwordFocus,
          autoFocus: false,
          controller: _viewmodel.passwordController,
          prefixIcon: Icon(Icons.lock),
          margin: EdgeInsets.only(top: 20,left: 20,right: 20),
          text: 'Password',
          emptyError: 'Password should not be empty',
          lengthError: 'Password length should greater than 8',
          minLength: 8,
          isObscurred: true,
          regExp:(RegExp(r'[0-9]')),
        ),
        Container(
            margin: EdgeInsets.only(top: 70,left: 20,right: 20),
            alignment: Alignment.center,
            child:Wrap(
                children:[
                  PrimaryButton(
                      text: 'CREATE',
                      txtColor: AppColors.WHITE,
                      bgColor: AppColors.PRIMARY_COLOR,
                      fontfamily: AppFont.FONT,
                      fontWeight: FontWeight.w500,
                      fontSize: AppDimen.TEXT_SMALL,
                      radius: 5,
                      onPressed:(){
                        App().setNavigation(context, AppRoutes.APP_NAME_FIELDS);
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
                      text1: 'Already have an account? ',
                      text2: 'Signin',
                      txtColor: AppColors.BLACK,
                      width: 250,
                      fontfamily: AppFont.FONT,
                      fontWeight: FontWeight.w600,
                      fontSize: AppDimen.TEXT_SMALL,
                      onPressed:(){
                        App().setNavigation(context, AppRoutes.APP_LOGIN);
                      })
                ]
            )
        ),
      ],
    );
  }
}
