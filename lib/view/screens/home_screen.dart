import 'dart:developer';

import 'package:flutter/material.dart';

import '../../common/services/setting_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              Services.setUserData({});
            },
            child: const Text('Home Screen')),
      ),
    );
  }
}
