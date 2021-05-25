import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inses_app/database/app_preferences.dart';
import 'package:inses_app/database/constants.dart';
import 'package:inses_app/utils/url.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(Initial());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {

    RemoteConfig remoteConfig = RemoteConfig.instance;
    remoteConfig.setDefaults(<String, dynamic>{
      'endpoint': AppUrl.BASE_URL,
    });

    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 30),
      minimumFetchInterval: Duration(hours: 1),
    ));

    bool updated = await remoteConfig.fetchAndActivate();
    if (updated) {
      AppUrl.BASE_URL = remoteConfig.getString('endpoint');
    }

    if (event is NavigateToHome) {
      await Future.delayed(Duration(seconds: 3));
      yield Loading();
      String loginStatus = await AppPreferences().getLoginStatus();
      AppConstants.THEME = await AppPreferences().getTheme();
      print(AppConstants.THEME);
      Future.delayed(Duration(seconds: 7));
      yield Loaded();
      if (loginStatus == AppConstants.LOGGED_IN) {
        yield Welcome();
      } else if (loginStatus == AppConstants.LOGGED_OUT) {
        yield Authenticate();
      } else {
        yield Authenticate();
      }
    }
  }
}
