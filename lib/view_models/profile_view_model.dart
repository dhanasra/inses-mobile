import 'package:flutter/cupertino.dart';
import 'package:inses_app/app/app.dart';

class ProfileViewModel {
  static ProfileViewModel? _instance;
  late TextEditingController messageController;
  late FocusNode messageFocus;
  late TextEditingController nameController;
  late FocusNode nameFocus;
  late TextEditingController emailController;
  late FocusNode emailFocus;
  late TextEditingController passwordController;
  late FocusNode passwordFocus;
  late TextEditingController newpasswordController;
  late FocusNode newpasswordFocus;
  late TextEditingController oldpasswordController;
  late FocusNode oldpasswordFocus;
  late TextEditingController phoneController;
  late FocusNode phoneFocus;

  static String name = '';
  static String phone = '';
  static String address = '';
  static String email = '';

  factory ProfileViewModel(App app) {
    _instance ??= ProfileViewModel._internal();
    return _instance!;
  }

  ProfileViewModel._internal() {
    _init();
  }

  void _init() {
    nameFocus = FocusNode();
    nameController = TextEditingController(text: "");
    oldpasswordFocus = FocusNode();
    oldpasswordController = TextEditingController(text: "");
    passwordFocus = FocusNode();
    passwordController = TextEditingController(text: "");
    newpasswordFocus = FocusNode();
    newpasswordController = TextEditingController(text: "");
    messageFocus = FocusNode();
    messageController = TextEditingController(text: "");
    phoneFocus = FocusNode();
    phoneController = TextEditingController(text: "");
    emailFocus = FocusNode();
    emailController = TextEditingController(text: "");

    passwordController.addListener(() {
      String password = passwordController.text.toString();
      if (password.isNotEmpty && (password[0] == " " || password[0] == "."))
        passwordController.text = "";
    });

    oldpasswordController.addListener(() {
      String password = oldpasswordController.text.toString();
      if (password.isNotEmpty && (password[0] == " " || password[0] == "."))
        oldpasswordController.text = "";
    });

    newpasswordController.addListener(() {
      String password = newpasswordController.text.toString();
      if (password.isNotEmpty && (password[0] == " " || password[0] == "."))
        newpasswordController.text = "";
    });

    nameController.addListener(() {
      String password = nameController.text.toString();
      if (password.isNotEmpty && (password[0] == " " || password[0] == "."))
        nameController.text = "";
    });

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
