import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:inses_app/app/app.dart';
import 'package:intl/intl.dart';

class OrderViewModel {
  static OrderViewModel _instance;
  var addressController;
  FocusNode addressFocus;

  DateFormat dayformatter = DateFormat('MMM');
  DateFormat dateformatter = DateFormat('dd');
  DateFormat dateTimeformatter = DateFormat('dd MMM');

  static String category = '';
  static String address = '';
  static String service = '';
  static int noOfService = 0;
  static int totalPrice = 0;
  static int basePrice = 100;
  static String date;
  static String time = '';
  static String isCash = '';
  static String isPaid = '';

  factory OrderViewModel(App app) {
    _instance ??= OrderViewModel._internal();
    return _instance;
  }

  OrderViewModel._internal() {
    _init();
  }

  void _init() {
    addressFocus = FocusNode();
    addressController = TextEditingController(text: "");

    addressController.addListener(() {
      String password = addressController.text.toString();
      if (password.isNotEmpty && (password[0] == " " || password[0] == "."))
        addressController.text = "";
    });
  }

}