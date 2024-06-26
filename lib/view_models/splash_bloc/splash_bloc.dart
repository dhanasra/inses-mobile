
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:inses_app/database/app_preferences.dart';
import 'package:inses_app/database/constants.dart';
import 'package:inses_app/network/app_api_client.dart';
import 'package:inses_app/network/bloc/network_state.dart' as Net;
import 'package:inses_app/network/models/user_address.dart';
import 'package:inses_app/utils/global.dart';
import 'package:inses_app/utils/url.dart';
import 'package:inses_app/view_models/home_view_model.dart';
import 'package:inses_app/view_models/profile_view_model.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(Initial());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {

    // RemoteConfig remoteConfig = RemoteConfig.instance;
    // remoteConfig.setDefaults(<String, dynamic>{
    //   'endpoint': AppUrl.BASE_URL,
    //   'appurl':AppUrl.APP_URL
    // });
    //
    // await remoteConfig.setConfigSettings(RemoteConfigSettings(
    //   fetchTimeout: Duration(seconds: 30),
    //   minimumFetchInterval: Duration(hours: 1),
    // ));
    //
    // bool updated = await remoteConfig.fetchAndActivate();
    // if (updated) {
    //   AppUrl.BASE_URL = remoteConfig.getString('endpoint');
    //   AppUrl.APP_URL = remoteConfig.getString('appurl');
    // }

    print(AppUrl.BASE_URL);

    if (event is NavigateToHome) {
      await Future.delayed(Duration(seconds: 3));
      yield Loading();
      String loginStatus = await AppPreferences().getLoginStatus();
      print(loginStatus);
      if (loginStatus == AppConstants.LOGGED_IN || loginStatus==AppConstants.LOGGED_IN_ADMIN) {
        HomeViewModel.loginStatus = loginStatus;
        try {
          
          //TODO: Version 2 -> Initializing user address globally
          List<UserAddress> addresses = await AppApiClient(httpClient: Client()).getUserAddressList();
          Global.userAddresses.value = addresses;
          


          String address = await AppApiClient(httpClient: Client()).getUserAddress();

          ProfileViewModel.address = address;
        
          Net.GotUserDetails userDetails = await AppApiClient(
              httpClient: Client()).getUserDetails() as Net.GotUserDetails;

          ProfileViewModel.name = userDetails.name??'';
          ProfileViewModel.phone = userDetails.phone??'';
          yield Welcome();
        }catch(e){
          yield Error();
        }
      } else if (loginStatus == AppConstants.LOGGED_OUT) {
        yield Authenticate();
      } else {
        yield Authenticate();
      }
    }
  }
}
