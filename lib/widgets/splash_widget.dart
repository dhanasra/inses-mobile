import 'package:flutter/material.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/resources/app_colors.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 1500));
    offset = Tween<Offset>(begin:Offset(-5.0,0.0),end: Offset(0.0,0.0)).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
              color: AppColors.SECONDARY_COLOR,
              child: Center(
                child: ImageView(asset: 'logo-v1.png',width: 100,),
              ),
        );
      }
}
