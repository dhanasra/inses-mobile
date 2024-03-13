
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
import 'package:inses_app/widgets/input_item.dart';
import 'package:inses_app/widgets/loader.dart';
import 'package:inses_app/widgets/mini_title.dart';

class ForgetPasswordSettings extends StatefulWidget {
  @override
  _ForgetPasswordSettingsState createState() => _ForgetPasswordSettingsState();
}

class _ForgetPasswordSettingsState extends State<ForgetPasswordSettings> {
  late NetworkBloc bloc;
  AppRepository appRepository =
      AppRepository(appApiClient: AppApiClient(httpClient: Client()));
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ProfileViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ProfileViewModel(App());
    viewModel.phoneController.text = "";
    viewModel.passwordController.text = "";
    //viewModel.newpasswordController.text = "";
    bloc = NetworkBloc(appRepository: appRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: App().appBarBack(
          context,
          'Forget Password',
        ),
        body: Form(
            key: _formKey,
            child: BlocBuilder<NetworkBloc, NetworkState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is Empty || state is Loading) {
                  return buildView(true);
                } else if (state is Error) {
                  Future.delayed(Duration.zero, () async {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Wrap(
                      children: [
                        Content(
                          padding: EdgeInsets.only(top: 5, bottom: 5),
                          text: 'Password Not Recovered',
                          fontSize: AppDimen.TEXT_SMALL,
                          fontWeight: FontWeight.w400,
                          fontfamily: AppFont.FONT,
                        ),
                      ],
                    )));
                  });
                  viewModel.phoneController.text = '';
                  return buildView(false);
                } else if (state is Initial || state is Success) {
                  if (state is Success) {
                    Future.delayed(Duration.zero, () async {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Wrap(
                        children: [
                          Content(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            text: 'Password Reset successfully',
                            fontSize: AppDimen.TEXT_SMALL,
                            fontWeight: FontWeight.w400,
                            fontfamily: AppFont.FONT,
                          ),
                        ],
                      )));
                    });
                  }
                  viewModel.phoneController.text = '';
                  return buildView(false);
                } else {
                  return Container();
                }
              },
            )));
  }

  Widget buildView(bool isLoading) {
    return ListView(
      children: [
        MiniTitle(
          text: 'Reset Account Password',
        ),
        InputItem(
          focusNode: viewModel.phoneFocus,
          autoFocus: false,
          controller: viewModel.phoneController,
          prefixIcon: Icon(Icons.phone),
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          text: 'Mobile Number',
          emptyError: 'Number should not be empty',
          lengthError: 'number length should greater than 10',
          isObscurred: false,
        ),
        InputItem(
          focusNode: viewModel.passwordFocus,
          autoFocus: false,
          controller: viewModel.passwordController,
          prefixIcon: Icon(Icons.lock),
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          text: 'New Password',
          emptyError: 'Password should not be empty',
          lengthError: 'Password length should greater than 5',
          minLength: 6,
          isObscurred: false,
        ),
        BorderContainer(
            radius: 4,
            margin: EdgeInsets.only(left: 15, right: 15, top: 30),
            padding: EdgeInsets.only(top: 5, bottom: 5),
            bgColor: AppColors.SECONDARY_COLOR,
            child: OnTapField(
              child: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Loader(
                          margin: EdgeInsets.all(0),
                        )
                      ],
                    )
                  : Content(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      text: 'RESET',
                      color: AppColors.WHITE,
                      fontfamily: AppFont.FONT,
                      fontSize: AppDimen.TEXT_SMALL,
                      fontWeight: FontWeight.w400,
                    ),
              onTap: () {
                Future.delayed(Duration.zero, () async {
                  // myFunction();
                  if (_formKey.currentState!.validate()) {
                    bloc.add(ForgetPassword(
                        phone: viewModel.phoneController.text,
                        password: viewModel.passwordController.text));
                  }
                });
              },
            ))
      ],
    );
  }
}
