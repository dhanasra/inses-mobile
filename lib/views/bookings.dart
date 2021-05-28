import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/views/current_booking.dart';
import 'package:inses_app/views/past_booking_item.dart';

class Bookings extends StatefulWidget {

  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(123),
                child: Column(
                  children: [
                    App().appBarBack(context, 'My Bookings'),
                    Container(
                      color: AppColors.WHITE,
                      child: TabBar(
                        indicatorWeight: 5,
                        unselectedLabelColor: AppColors.WHITE_1,
                        labelColor: AppColors.PRIMARY_COLOR,
                        indicatorColor: AppColors.SECONDARY_COLOR,
                        tabs: [
                          Container(
                            height: 55,
                            child: Tab(
                              text: 'ONGOING',
                            ),
                          ),
                          Container(
                            height: 55,
                            child: Tab(
                              text: 'HISTORY',
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
            body: Container(
              child: buildView(),
            ),
          )
      ),
    );
  }

  Widget buildView(){
    return TabBarView(
      children: [
        CurrentBooking(),
        PastBooking(),
      ],
    );
  }
}
