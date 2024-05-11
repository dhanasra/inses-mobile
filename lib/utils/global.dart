import 'package:flutter/material.dart';

import '../network/models/user_address.dart';

class Global {

  static ValueNotifier<List<UserAddress>> userAddresses = ValueNotifier([]);

}