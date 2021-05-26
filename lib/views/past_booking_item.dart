import 'package:flutter/cupertino.dart';
import 'package:inses_app/widgets/booking_item.dart';

class PastBooking extends StatefulWidget {

  @override
  _PastBookingState createState() => _PastBookingState();
}

class _PastBookingState extends State<PastBooking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildView(),
    );
  }

  Widget buildView(){
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context,index){
        return BookingItem();
      },
    );
  }
}
