import 'package:flutter/material.dart';


import '../../common/constants/colors.dart';
import '../../common/constants/fonts/fonts.dart';
import '../../common/functions/media_query.dart';

class RowDataWidget extends StatelessWidget {
  final String data;
  final IconData icon;

  const RowDataWidget({
    Key? key,
    required this.data,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Media.width(context, space: .05), vertical: 15),
      child: Row(
        children: [
          Icon(icon, color: AppColors.mainColor),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            data,
            style: Fonts.mainStyleBold.copyWith(
                color: AppColors.secondColor,
                fontSize: Media.width(context, space: .045)),
          )),
        ],
      ),
    );
  }
}
