import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/network/app_api_client.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';

import '../comps/input_field.dart';
import 'input_item.dart';
import 'mini_title.dart';

class AddressDialogue extends StatelessWidget {
  final TextEditingController pincodeController;
  final TextEditingController addressController;
  final TextEditingController addressTypeController;
  final GlobalKey<FormState> formKey;
  final VoidCallback onPressed;

  AddressDialogue({
    required this.onPressed, required this.formKey, required this.pincodeController, required this.addressController, required this.addressTypeController
});

  @override
  Widget build(BuildContext context) {
    addressController.text = "";
    addressTypeController.text = "";
    pincodeController.text = "";

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context){

    return Form(
      key: formKey,
      child: Stack(
        children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20,top: 35, right: 20,bottom: 20
                  ),
                  margin: EdgeInsets.only(top: 45),
                  decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.black,offset: Offset(0,10),
                     blurRadius: 10
                    ),
                  ]
                  ),
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MiniTitle(
                      text: 'Add Address',
                    ),
                    InputItem(
                      controller: addressTypeController,
                      prefixIcon: Icon(Icons.edit),
                      margin: EdgeInsets.only(top: 0, left: 15, right: 15),
                      text: 'Address Type ex: home',
                      emptyError: 'Address type should not be empty',
                      inputType: TextInputType.text,
                      isObscurred: false,
                    ),
                    InputField(
                      text: 'Enter your address',
                      isShadow: false,
                      errorMaxLines: 3,
                      autoFocus: false,
                      margin: EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 15),
                      controller: addressController,
                      emptyErrorText: 'Address Should not be empty',
                      enabledBorderColor: AppColors.WHITE_1,
                      enabledBorderWidth: 1.0,
                      focusedBorderColor: AppColors.SECONDARY_COLOR,
                      hintColor: AppColors.GRAY_2,
                      focusedBorderWidth: 1.0,
                      inputType: TextInputType.multiline,
                      bgColor: AppColors.WHITE,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Icon(Icons.home),
                      ),
                      hoverColor: AppColors.SECONDARY_COLOR,
                      radius: 3,
                      height: 80,
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
                  InputItem(
                    controller: pincodeController,
                    prefixIcon: Icon(Icons.room),
                    margin: EdgeInsets.only(top: 0, left: 15, right: 15),
                    text: 'Pincode',
                    emptyError: 'Pincode should not be empty',
                    patternError: 'Enter a valid pincode',
                    inputType: TextInputType.phone,
                    isObscurred: false,
                    regExp: (RegExp(r'[0-9]')),
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: ()async{
                                if(formKey.currentState!.validate()) {
                                  await AppApiClient(httpClient: Client()).addUserAddress(addressController.text, pincodeController.text, addressType: addressTypeController.text);
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Content(
                                margin: EdgeInsets.only(top: 10,bottom: 10),
                                text: "Add",
                                alignment: Alignment.center,
                                textAlign: TextAlign.center,
                                textHeight: 1.5,
                                color: AppColors.BLACK_3,
                                fontfamily: AppFont.FONT,
                                letterSpacing: 1.2,
                                fontSize: AppDimen.TEXT_SMALLEST,
                                fontWeight: FontWeight.w500,
                              ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: (){

                                Navigator.of(context).pop();
                              },
                              child:Content(
                                margin: EdgeInsets.only(top: 10,bottom: 10),
                                text: 'Cancel',
                                alignment: Alignment.center,
                                textAlign: TextAlign.center,
                                textHeight: 1.5,
                                color: AppColors.GRAY,
                                fontfamily: AppFont.FONT,
                                letterSpacing: 1.2,
                                fontSize: AppDimen.TEXT_SMALLEST,
                                fontWeight: FontWeight.w500,
                              ),
                          ),
                        ),
                      ],
                    )
                  ],
                  ),
            ),
          Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 5,
              child: BorderContainer(
                radius: 40,
                bgColor: AppColors.WHITE,
                padding: EdgeInsets.all(5),
                child: Icon(Icons.location_on,color: AppColors.PRIMARY_COLOR,),
              )
            )
          )
        ],
      ),
    );
  }
}
