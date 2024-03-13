import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inses_app/app/app.dart';

class RegisterViewModel {
  static RegisterViewModel? _instance;
  var passwordController;
  var nameController;
  var phoneController;
  var emailController;
  var addressController;
  late FocusNode phoneFocus;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  late FocusNode nameFocus;
  late FocusNode addressFocus;
  StreamController<bool> loadController = StreamController<bool>.broadcast();

  static String name = '';
  static String phone = '';
  static String gender = 'Male';
  static String exam = '';
  static String image = '';
  static int type = 0;
  static bool isAcceptedTerms = false;
  static String lang = 'en';

  factory RegisterViewModel(App app) {
    _instance ??= RegisterViewModel._internal();
    return _instance!;
  }

  RegisterViewModel._internal() {
    _init();
  }

  void _init() {
    phoneFocus = FocusNode();
    passwordFocus = FocusNode();
    nameFocus = FocusNode();
    addressFocus = FocusNode();
    emailFocus = FocusNode();
    passwordController = TextEditingController(text: "");
    nameController = TextEditingController(text: "");
    addressController = TextEditingController(text: "");
    phoneController = TextEditingController(text: "");
    emailController = TextEditingController(text: "");
    passwordController.addListener(() {
      String password = passwordController.text.toString();
      if (password.isNotEmpty && (password[0] == " " || password[0] == "."))
        passwordController.text = "";
    });

    nameController.addListener(() {
      String fName = nameController.text.toString();
      if (fName.isNotEmpty && (fName[0] == " " || fName[0] == "."))
        nameController.text = "";
    });

    phoneController.addListener(() {
      String fName = phoneController.text.toString();
      if (fName.isNotEmpty && (fName[0] == " " || fName[0] == "."))
        phoneController.text = "";
    });

    addressController.addListener(() {
      String fName = addressController.text.toString();
      if (fName.isNotEmpty && (fName[0] == " " || fName[0] == "."))
        addressController.text = "";
    });
    emailController.addListener(() {
      String fName = emailController.text.toString();
      if (fName.isNotEmpty && (fName[0] == " " || fName[0] == "."))
        emailController.text = "";
    });
  }

  Future<void> getPosition() async {
    bool locationPermission = await App().locationPermission();
    if (locationPermission) {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {}
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {}
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
}
