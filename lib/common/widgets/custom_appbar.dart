import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../constants/colors.dart';
import '../constants/fonts/fonts.dart';
import '../functions/media_query.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final double? height;
  final bool enableBackButton;

  const CustomAppBar({
    Key? key,
    this.title,
    this.height,
    this.enableBackButton = false,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height ?? 90);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Text(
          widget.title!,
          style: Fonts.mainStyleBold.copyWith(
              color: Colors.white, fontSize: Media.width(context, space: .06)),
        ),
      ),
      centerTitle: true,
      toolbarHeight: Media.height(context),
      backgroundColor: AppColors.mainColor,
      leading: widget.enableBackButton == false
          ? null
          : Padding(
              padding: const EdgeInsets.only(top: 15),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 30,
                ),
              ),
            ),
    );
  }
}
