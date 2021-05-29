import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/tap_field.dart';
import 'package:inses_app/network/app_api_client.dart';
import 'package:inses_app/network/app_repository.dart';
import 'package:inses_app/network/bloc/network_bloc.dart';
import 'package:inses_app/network/bloc/network_event.dart';
import 'package:inses_app/network/bloc/network_state.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/view_models/profile_view_model.dart';
import 'package:inses_app/widgets/error_item.dart';
import 'package:inses_app/widgets/input_item.dart';
import 'package:inses_app/widgets/loader.dart';
import 'package:inses_app/widgets/mini_title.dart';

class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  NetworkBloc bloc;
  AppRepository appRepository = AppRepository(appApiClient: AppApiClient(httpClient: Client()));
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProfileViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ProfileViewModel(App());
    bloc = NetworkBloc(appRepository: appRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App().appBarBack(
        context,
        'Settings',
      ),
      body: Form(
          key: _formKey,
          child:BlocBuilder<NetworkBloc,NetworkState>(
            bloc: bloc,
            builder: (context,state){
              if(state is Empty || state is Loading){
                return buildView(true);
              }else if(state is Error){
                return ErrorItem();
              }else if(state is Initial || state is PhoneNumberUpdated){
                viewModel.phoneController.text = '';
                return buildView(false);
              }else{
                return Container();
              }
            },
          )
      )
    );
  }

  Widget buildView(bool isLoading){
    return ListView(
      children: [
        MiniTitle(
          text: 'Update Phone Number',
        ),
        InputItem(
          focusNode: viewModel.phoneFocus,
          controller: viewModel.phoneController,
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
            padding: EdgeInsets.only(top: 5,bottom: 5),
            bgColor: AppColors.SECONDARY_COLOR,
            child: OnTapField(
              child: isLoading
                  ?Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Loader(margin: EdgeInsets.all(0),)
                ],
              )
                  :Content(
                padding: EdgeInsets.only(top: 10,bottom: 10),
                text: 'UPDATE',
                color: AppColors.WHITE,
                fontfamily: AppFont.FONT,
                fontSize: AppDimen.TEXT_SMALL,
                fontWeight: FontWeight.w400,
              ),
              onTap: (){
                if(_formKey.currentState.validate()) {
                  bloc.add(UpdatePhoneNumber(number: viewModel.phoneController.text));
                }
              },
            )
        )
      ],
    );
  }
}
