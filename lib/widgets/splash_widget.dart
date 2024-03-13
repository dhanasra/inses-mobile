import 'package:flutter/material.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/resources/app_colors.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    offset = Tween<Offset>(begin: Offset(-5.0, 0.0), end: Offset(0.0, 0.0))
        .animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.WHITE,
          child: Center(
            child: ImageView(
              asset: 'logo-h1.png',
              width: 100,
              height: 50,
            ),
          ),
        ),
        /*Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Content(
              width: double.infinity,
              alignment: Alignment.center,
              text: 'SPIDERLINGZ',
              fontfamily: AppFont.FONT,
              color: AppColors.WHITE_1,
              fontWeight: FontWeight.w400,
              fontSize: AppDimen.TEXT_SMALLER,
            ))*/
      ],
    );
  }
}
