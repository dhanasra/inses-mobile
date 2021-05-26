import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/app/app_routes.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/image_view.dart';
import 'package:inses_app/comps/line.dart';
import 'package:inses_app/comps/tap_field.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/widgets/grey_micro.dart';
import 'package:inses_app/widgets/profile_option.dart';
import 'package:inses_app/widgets/sub_title.dart';
import 'package:line_icons/line_icons.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App().appBarBack(context, 'Profile'),
      body: Container(
        child: buildView(),
      ),
    );
  }

  Widget buildView(){
    return Container(
      child: ListView(
        children: [
          Row(
            children: [
            Container(
                  margin: EdgeInsets.all(20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: ImageView(
                        width: 80,
                        asset: 'male.png',
                      )
                  ),
                ),
              Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        SubTitle(text: 'Dhana Sekaran',),
                        GreyMicro(
                          alignment: Alignment.centerLeft,
                          text: '1dhana625@gmail.com',
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
          Line(width:100, height: 3,color: AppColors.WHITE_1,),
          ProfileOption(
            option: 'My profile',
            sub: 'Your profile details',
            icon: Icons.person_pin_rounded,
            onPressed: (){
            },
          ),
          ProfileOption(
            option: 'Payments',
            sub: 'View my payment history',
            icon: Icons.payment,
            onPressed: (){},
          ),
          ProfileOption(
            option: 'Bookings',
            sub: 'View my booking history',
            icon: Icons.event_note_sharp,
            onPressed: (){},
          ),
          ProfileOption(
            option: 'About',
            sub: 'About karkai app',
            icon: Icons.info_outline,
            onPressed: (){},
          ),
          ProfileOption(
            option: 'Contact',
            sub: 'Mail to Karkai help center',
            icon: Icons.phone,
            onPressed: (){
            },
          )
        ],
      ),
    );
  }
}
