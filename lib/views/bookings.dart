import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/resources/app_colors.dart';
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
                preferredSize: Size.fromHeight(80),
                child: Container(
                  color: AppColors.WHITE,
                  child: TabBar(
                    unselectedLabelColor: AppColors.WHITE_1,
                    labelColor: AppColors.PRIMARY_COLOR,
                    indicatorColor: AppColors.SECONDARY_COLOR,
                    tabs: [
                      Container(
                        height: 55,
                        child: Tab(
                          text: 'In Progress',
                        ),
                      ),
                      Container(
                        height: 55,
                        child: Tab(
                          text: 'Completed',
                        ),
                      ),
                    ],
                  ),
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
