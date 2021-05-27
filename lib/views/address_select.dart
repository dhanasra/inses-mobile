import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/comps/border_container.dart';
import 'package:inses_app/comps/content.dart';
import 'package:inses_app/comps/input_field.dart';
import 'package:inses_app/comps/line.dart';
import 'package:inses_app/comps/tap_field.dart';
import 'package:inses_app/model/area.dart';
import 'package:inses_app/resources/app_colors.dart';
import 'package:inses_app/resources/app_dimen.dart';
import 'package:inses_app/resources/app_font.dart';
import 'package:inses_app/widgets/input_item.dart';
import 'package:inses_app/widgets/input_item_two.dart';
import 'package:inses_app/widgets/mini_title.dart';

class AddressSelect extends StatefulWidget {

  @override
  _AddressSelectState createState() => _AddressSelectState();
}

class _AddressSelectState extends State<AddressSelect> with AutomaticKeepAliveClientMixin{

  Completer<GoogleMapController> _controller;
  CameraPosition _kGooglePlex;
  StreamController<Position> mapController;
  StreamController<String> addressController;
  List<AreaModel> areas;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _controller = Completer();
    mapController = StreamController();
    addressController = StreamController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App().appBarBack(
          context,
          'Your Address',
          child: OnTapField(
              child: Icon(Icons.location_on,color: AppColors.PRIMARY_COLOR,),
              onTap: (){}
          )
      ),
      body: Container(
        child: buildView(),
      ),
    );
  }

  Widget buildView(){
    return ListView(
      children: [
        Container(
          height: 180,
          child: StreamBuilder(
            stream: mapController.stream,
            initialData: Position(latitude: 9.925201,longitude: 78.119774),
            builder: (context,AsyncSnapshot shot){
              _kGooglePlex = CameraPosition(
                  target: LatLng(shot.data.latitude, shot.data.longitude),
                  zoom: 8.4746
              );
              List<Marker> markers = [Marker(
                markerId: MarkerId('Area'),
                position: LatLng(shot.data.latitude,shot.data.longitude),
                infoWindow: InfoWindow(title: 'address', snippet: '*'),
                onTap: () {

                },
              )];
              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: Set<Marker>.of(markers),
              );
            },
          )
        ),
        Line(
          width: double.infinity,
          height: 5,
          color: AppColors.WHITE_1,
          margin: EdgeInsets.only(bottom: 10),
        ),
        MiniTitle(
          text: 'Address',
        ),
        InputField(
            text: 'Enter your address',
            isShadow: false,
            errorMaxLines: 3,
            autoFocus: false,
            margin: EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 20),
            // controller: _viewmodel.addressController,
            emptyErrorText: 'Email Id Should not be empty',
            patternErrorText: 'Please Enter a valid Email Id',
            enabledBorderColor: AppColors.WHITE_1,
            enabledBorderWidth: 1.0,
            focusedBorderColor: AppColors.SECONDARY_COLOR,
            hintColor: AppColors.GRAY_2,
            focusedBorderWidth: 1.0,
            inputType: TextInputType.multiline,
            bgColor: AppColors.WHITE,
            prefixIcon: Padding(
              padding: EdgeInsets.only(bottom: 70),
              child: Icon(Icons.home),
            ),
            hoverColor: AppColors.SECONDARY_COLOR,
            radius: 3,
            height: 120,
            minLine: 100,
            maxLine: 100,
            expands: true,
            textAlignVertical: TextAlignVertical.top,
            color: AppColors.BLACK,
            fontfamily: AppFont.FONT,
            fontWeight: FontWeight.w500,
            fontSize: AppDimen.TEXT_SMALLER,
            contentPadding: EdgeInsets.only(
                top: 15, bottom: 15, left: 10, right: 10),
            width: 400),
        MiniTitle(
          text: 'Save as',
        ),
        StreamBuilder(
            stream: addressController.stream,
            builder: (context,AsyncSnapshot shot){
              return Column(
                children: [
                  BorderContainer(
                    margin: EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OnTapField(
                            child: saveItem(Icons.home,'home',shot.hasData?shot.data=='home'?true:false:false,),
                            onTap: (){
                              addressController.add('home');
                            }
                        ),
                        OnTapField(
                            child: saveItem(Icons.work,'work',shot.hasData?shot.data=='work'?true:false:false,),
                            onTap: (){
                              addressController.add('work');
                            }
                        ),
                        OnTapField(
                            child: saveItem(Icons.add_location_alt,'other',shot.hasData?shot.data=='other'?true:false:false,),
                            onTap: (){
                              addressController.add('other');
                            }
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible:shot.data=='other'?true:false,
                      child: InputItemTwo(
                        // focusNode: _viewmodel.phoneFocus,
                        // controller: _viewmodel.phoneController,
                        prefixIcon: Icon(Icons.add_location_rounded),
                        autoFocus: false,
                        margin: EdgeInsets.only(top: 10,left: 15,right: 15),
                        text: 'Save as office, shop etc.',
                        emptyError: 'Phone number should not be empty',
                        lengthError: 'Enter a valid phone number',
                        patternError: 'Enter a valid phone number',
                        minLength: 10,
                        inputType: TextInputType.phone,
                        isObscurred: false,
                        regExp:(RegExp(r'[0-9]')),
                      ),
                  )
                ],
              );
            }),
      ],
    );
  }

  Widget saveItem(IconData iconData,String title,bool isClicked){
    return Container(
        width: 110,
        child: BorderContainer(
          borderColor: isClicked?AppColors.SECONDARY_COLOR:AppColors.WHITE_1,
          radius: 5,
          padding: EdgeInsets.all(15),
          bgColor: isClicked?AppColors.WHITE:AppColors.WHITE_1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconData,size: 15,),
                Content(
                  padding: EdgeInsets.only(left: 5),
                  alignment: Alignment.center,
                  text: title,
                  fontfamily: AppFont.FONT,
                  color: AppColors.BLACK,
                  fontWeight: FontWeight.w500,
                  fontSize: AppDimen.TEXT_SMALLEST,
                )
          ],
        ),
      )
    );
  }

}
