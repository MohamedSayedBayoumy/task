import 'package:flutter/material.dart';

import '../../common/constants/fonts/fonts.dart';
import '../../common/constants/images.dart';
import '../../common/functions/media_query.dart';

class LogoWidget extends StatelessWidget {
  final String titleScreen;
  const LogoWidget({super.key, required this.titleScreen});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: Media.height(context, space: .08), bottom: 20),
          child: Image.asset(Images.logo,
              height: Media.height(context, space: .15)),
        ),
        Text(
          titleScreen,
          style: Fonts.mainStyleBold.copyWith(
            fontSize: Media.width(context, space: .07),
          ),
        )
      ],
    );
  }
}
