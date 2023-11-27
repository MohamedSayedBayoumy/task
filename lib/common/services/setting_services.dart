import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService {
  static late SharedPreferences sharedPreferences;

  Future<Services> initialize() async {
    sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }

  static Future setUserData(Map? user) async {
    final encoding = json.encode(user);
    if (kDebugMode) {
      print("Set User :$encoding");
    }
    return Services.sharedPreferences.setString("user", encoding);
  }

  static Future<Map> getUserData() async {
    final getUser = Services.sharedPreferences.getString("user");
    final user = json.decode(getUser.toString());

    if (kDebugMode) {
      print("get User: $user");
    }

    return user;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().initialize());
}
