import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/model/service.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';

class ServiceItem extends StatelessWidget {
  final ServiceModel serviceModel;

  ServiceItem({this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: BorderContainer(
        radius: 5,
        bgColor: AppColors.WHITE,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 50,
              height: 50,
              child: ImageView(
                width: 50,
                url: serviceModel.img,
              ),
            ),
            Content(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              text: serviceModel.name,
              fontfamily: AppFont.FONT,
              color: AppColors.BLACK,
              fontWeight: FontWeight.w500,
              fontSize: AppDimen.TEXT_SMALLEST,
            )
          ],
        ),
      ),
    );
  }
}
