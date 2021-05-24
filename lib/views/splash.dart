import 'package:flutter/material.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/resources/app_colors.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: AppColors.SECONDARY_COLOR,
          child: Center(
            child: ImageView(asset: 'logo-v1.png',width: 100,),
          ),
        )
      );
  }
}
