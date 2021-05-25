import 'package:flutter/cupertino.dart';
import 'package:inses_app/comps/input_field.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';

class InputItem extends StatelessWidget {
  final TextEditingController controller;
  final RegExp regExp;
  final bool validator;
  final String text;
  final String emptyError;
  final String patternError;
  final String lengthError;
  final bool isObscurred;
  final TextInputType inputType;
  final FocusNode focusNode;
  final bool isShadow;
  final bool autoFocus;
  final Icon prefixIcon;
  final int minLength;
  final EdgeInsetsGeometry margin;

  InputItem({
    this.margin,
    this.minLength,
    this.lengthError,
    this.patternError,
    this.emptyError,
    this.autoFocus,
    this.prefixIcon,
    this.isShadow,
    this.controller,
    this.regExp,
    this.validator,
    this.text,
    this.isObscurred,
    this.inputType,
    this.focusNode
  });


  @override
  Widget build(BuildContext context) {
    return InputField(
        margin: margin??EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
        text: text,
        controller: controller,
        isShadow: isShadow??true,
        regExp: regExp,
        minLength: minLength,
        errorMaxLines: 3,
        inputType: inputType,
        isObscured: isObscurred,
        emptyErrorText: emptyError,
        hintColor: AppColors.GRAY_2,
        patternErrorText: patternError,
        lengthErrorText: lengthError,
        enabledBorderColor: AppColors.WHITE_1,
        enabledBorderWidth: 1.0,
        focusedBorderColor: AppColors.SECONDARY_COLOR,
        focusedBorderWidth: 1.0,
        validate: validator,
        focusNode: focusNode,
        autoFocus: autoFocus,
        prefixIcon: prefixIcon,
        hoverColor: AppColors.SECONDARY_COLOR,
        radius: 3,
        color: AppColors.BLACK,
        fontfamily: AppFont.FONT,
        fontWeight: FontWeight.w500,
        fontSize: AppDimen.TEXT_SMALLER,
        contentPadding: EdgeInsets.only(
            top: 15, bottom: 15, left: 10, right: 10),
        width: 400);
  }
}
