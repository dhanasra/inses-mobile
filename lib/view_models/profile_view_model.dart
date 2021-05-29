import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:inses_app/app/app.dart';

class ProfileViewModel {
  static ProfileViewModel _instance;
  var messageController;
  FocusNode messageFocus;
  var phoneController;
  FocusNode phoneFocus;

  static String name = '';
  static String phone = '';

  factory ProfileViewModel(App app) {
    _instance ??= ProfileViewModel._internal();
    return _instance;
  }

  ProfileViewModel._internal() {
    _init();
  }

  void _init() {
    messageFocus = FocusNode();
    messageController = TextEditingController(text: "");
    phoneFocus = FocusNode();
    phoneController = TextEditingController(text: "");

    messageController.addListener(() {
      String password = messageController.text.toString();
      if (password.isNotEmpty && (password[0] == " " || password[0] == "."))
        messageController.text = "";
    });

    phoneController.addListener(() {
      String password = phoneController.text.toString();
      if (password.isNotEmpty && (password[0] == " " || password[0] == "."))
        messageController.text = "";
    });
  }

}