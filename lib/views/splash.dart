import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/app/app_routes.dart';
import 'package:inses_app/view_models/splash_bloc/splash_bloc.dart';
import 'package:inses_app/view_models/splash_bloc/splash_event.dart';
import 'package:inses_app/view_models/splash_bloc/splash_state.dart';
import 'package:inses_app/widgets/loader.dart';
import 'package:inses_app/widgets/splash_widget.dart';
import 'launch.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final bloc = SplashBloc();

  @override
  void initState() {
    bloc.add(NavigateToHome());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => bloc,
        child: Scaffold(
          body: BlocBuilder<SplashBloc, SplashState>(
            builder: (context, state) {
              print(state);
              if (state is Initial || state is Loading || state is Loaded) {
                return
                  Stack(
                    children: [
                      SplashWidget(),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Loader()
                      )
                    ],
                  );
              } else if (state is Authenticate) {
                return Launch();
              } else if (state is Welcome) {
                App().setNavigation(context, AppRoutes.APP_SPLASH_LOAD);
                return SplashWidget();
              } else {
                return SplashWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
