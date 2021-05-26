import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/widgets/booking_item.dart';

class CurrentBooking extends StatefulWidget {

  @override
  _CurrentBookingState createState() => _CurrentBookingState();
}

class _CurrentBookingState extends State<CurrentBooking> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.pixels ==
          controller.position.maxScrollExtent) {

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildView(),
    );
  }

  Widget buildView(){
    return RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: ()async{
          await Future.delayed(Duration(seconds: 5));
        },
        child: ListView.builder(
          itemCount: 10+1,
          itemBuilder: (context,index){
            if(index == 10){
              return _buildProgressIndicator(true);
            }else {
              return BookingItem();
            }
          },
          controller: controller,
        ),
    );
  }

  Widget _buildProgressIndicator(bool isLoading) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
