import 'package:flutter/material.dart';
 

import '../../common/constants/colors.dart';
import '../../common/constants/fonts/fonts.dart';
import '../../common/functions/media_query.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const ListTileWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: Media.width(context, space: .01),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: Media.height(context, space: .005),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color(0xffd4d4d4),
                spreadRadius: 0,
                blurRadius: .5,
                offset: Offset(0, 1.5),
              ),
            ],
          ),
          child: Row(
            children: [
              Text(
                title,
                style: Fonts.mainStyleBold.copyWith(
                  fontSize: Media.width(context, space: .05),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
