import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inses_app/app/app.dart';
import 'package:inses_app/model/bookings.dart';
import 'package:inses_app/utils/global.dart';
import 'package:inses_app/widgets/address_dialog.dart';
import 'package:intl/intl.dart';

class OrderViewModel {
  static OrderViewModel? _instance;
  late TextEditingController addressController;
  late FocusNode addressFocus;
  late TextEditingController pincodeController;
  late FocusNode pincodeFocus;
  late TextEditingController addressTypController;
  late FocusNode addressTypeFocus;
  late ValueNotifier<int?> addressId;

  DateFormat dayformatter = DateFormat('MMM');
  DateFormat dateformatter = DateFormat('dd');
  DateFormat dateTimeformatter = DateFormat('dd MMM');

  static int? categoryId ;
  static int? serviceId ;
  static int? orderId ;
  static String serviceIcon = '' ;
  static String serviceImage = '' ;
  static String category='';
  static String address = '';
  static String pincode = '';
  static String service = '';
  static int noOfService = 0;
  static int totalPrice = 0;
  static int basePrice = 100;
  static bool load1 = false;
  static bool load2 = false;
  static bool load3 = false;
  static bool load4 = false;
  static String? date;
  static String time = '';
  static String startTime = '';
  static String endTime = '';
  static String isCash = '';
  static String isPaid = '';
  static BookingModel? booking ;

  factory OrderViewModel(App app) {
    _instance ??= OrderViewModel._internal();
    return _instance!;
  }

  OrderViewModel._internal() {
    _init();
  }

  void _init() {
    addressFocus = FocusNode();
    addressController = TextEditingController(text: "");
    pincodeFocus = FocusNode();
    pincodeController = TextEditingController(text: "");
    addressTypeFocus = FocusNode();
    addressTypController = TextEditingController(text: "");
    addressId = ValueNotifier(Global.userAddresses.value.length>0 ? Global.userAddresses.value[0].id: null);

    addressController.addListener(() {
      String password = addressController.text.toString();
      if (password.isNotEmpty && (password[0] == " " || password[0] == "."))
        addressController.text = "";
    });
  }

  Future<void> getPosition() async {
    bool locationPermission = await App().locationPermission();
    if (locationPermission) {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {

      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {

        }
      }
      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      if(placemarks.isNotEmpty){
        var placemark = placemarks[0];
        var address = '${placemark.name!=null? '${placemark.name}, ':''}${placemark.street!=null? '${placemark.street}, ':''}${placemark.locality!=null? '${placemark.locality}, ':''}${placemark.subLocality!=null? '${placemark.subLocality}, ':''}${placemark.administrativeArea!=null? '${placemark.administrativeArea}, ':''}${placemark.subAdministrativeArea!=null? '${placemark.subAdministrativeArea}, ':''}${placemark.country!=null? '${placemark.country}, ':''}${placemark.postalCode!=null? '${placemark.postalCode}':''}';
        addressController.text = address.toString();

      }
    }
  }


    showAddressDialogue(BuildContext context, GlobalKey<FormState> formKey) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AddressDialogue(
                formKey: formKey,
                addressController: addressController,
                addressTypeController: addressTypController,
                pincodeController: pincodeController,
                onPressed: () {

                });
          });
    }

}