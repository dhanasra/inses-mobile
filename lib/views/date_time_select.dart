import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/tap_field.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/views/time_item.dart';
import 'package:inses_app/widgets/date_item.dart';
import 'package:inses_app/widgets/mini_title.dart';
import 'package:inses_app/widgets/sub_title.dart';

class DateTimeSelect extends StatefulWidget {

  @override
  _DateTimeSelectState createState() => _DateTimeSelectState();
}

class _DateTimeSelectState extends State<DateTimeSelect> {

  StreamController dateController;
  StreamController timeController;

  @override
  void initState() {
    dateController = StreamController();
    timeController = StreamController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App().appBarBack(context, 'Schedule Your Service'),
      body: Container(
        child: buildView(),
      ),
    );
  }

  Widget buildView(){
    return ListView(
      children: [
        MiniTitle(text: 'When do you need this service',margin: EdgeInsets.only(top: 30,bottom: 10,left: 20),),
        StreamBuilder(
          stream: dateController.stream,
          builder: (context,AsyncSnapshot shot){
            return BorderContainer(
              margin: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OnTapField(
                      child: DateItem(date: '25',day: 'MON',isSelected: shot.hasData?shot.data=='today'?true:false:false,),
                      onTap: (){
                        dateController.add('today');
                      }
                  ),
                  OnTapField(
                      child: DateItem(date: '26',day: 'THU',isSelected: shot.hasData?shot.data=='tomorrow'?true:false:false,),
                      onTap: (){
                        dateController.add('tomorrow');
                      }
                  ),
                  OnTapField(
                      child: DateItem(date: 'pick',day: 'Pick date',isSelected: shot.hasData?shot.data=='pick'?true:false:false,),
                      onTap: (){
                        selectDate(context);
                        dateController.add('pick');
                      }
                  )
                ],
              ),
            );
          }),
        MiniTitle(text: 'Select Time',margin: EdgeInsets.only(top: 10,bottom: 10,left: 20)),
        StreamBuilder(
            stream: timeController.stream,
            builder: (context,AsyncSnapshot shot){
              return BorderContainer(
                radius: 4,
                borderColor: AppColors.WHITE_1,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10,left: 20,right: 20),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: (2.2),
                  crossAxisSpacing: 10,
                  padding: EdgeInsets.only(bottom:7),
                  mainAxisSpacing: 15,
                  crossAxisCount: 3,
                  children: [
                    OnTapField(
                        child: TimeItem(time: '10AM - 11AM', isSelected: shot.hasData?shot.data=='10-11'?true:false:false,),
                        onTap: (){
                          timeController.add('10-11');
                        }
                    ),
                    OnTapField(
                        child: TimeItem(time: '11AM - 12PM', isSelected: shot.hasData?shot.data=='11-12'?true:false:false,),
                        onTap: (){
                          timeController.add('11-12');
                        }
                    ),
                    OnTapField(
                        child: TimeItem(time: '12PM -  1PM', isSelected: shot.hasData?shot.data=='12-1'?true:false:false,),
                        onTap: (){
                          timeController.add('12-1');
                        }
                    ),
                    OnTapField(
                        child: TimeItem(time: '1PM - 2PM', isSelected: shot.hasData?shot.data=='1-2'?true:false:false,),
                        onTap: (){
                          timeController.add('1-2');
                        }
                    ),
                    OnTapField(
                        child: TimeItem(time: '2PM - 3PM', isSelected: shot.hasData?shot.data=='2-3'?true:false:false,),
                        onTap: (){
                          timeController.add('2-3');
                        }
                    ),
                    OnTapField(
                        child: TimeItem(time: '3PM -  4PM', isSelected: shot.hasData?shot.data=='3-4'?true:false:false,),
                        onTap: (){
                          timeController.add('3-4');
                        }
                    ),
                    OnTapField(
                        child: TimeItem(time: '4PM -  5PM', isSelected: shot.hasData?shot.data=='4-5'?true:false:false,),
                        onTap: (){
                          timeController.add('4-5');
                        }
                    ),
                    OnTapField(
                        child: TimeItem(time: '5PM - 6PM', isSelected: shot.hasData?shot.data=='5-6'?true:false:false,),
                        onTap: (){
                          timeController.add('5-6');
                        }
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }

  Future<Null> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.SECONDARY_COLOR, // header background color
              onPrimary: AppColors.WHITE, // header text color
              onSurface: AppColors.BLACK, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: AppColors.GRAY, // button text color
              ),
            ),
          ),
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    dateController.close();
    timeController.close();
    super.dispose();
  }
}
