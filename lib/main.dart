import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/constants/fonts.dart';
import 'common/routes/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: Fonts.fontRegular,
      ),
      getPages: routes,
    );
  }
}
