// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_overrides
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:task/model/data/reposoity_pattern.dart';
import 'package:task/model/models/user_model.dart';

import '../common/eunm.dart';

class HomeController extends GetxController {
  Status status = Status.loading;

  final AuthenticationUser authenticationUser;

  UserData userModel = UserData();

  HomeController(this.authenticationUser);

  String failureMessage = "";

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getUser();
    });
  }

  Future getUser() async {
    final result = await authenticationUser.getUser();
    result.fold((l) {
      status = Status.failure;
      failureMessage = l.failureMessag;
      update();
    }, (r) {
      status = Status.loaded;
      userModel = r;
      print(r.toJson());
      update();
    });
  }
}
