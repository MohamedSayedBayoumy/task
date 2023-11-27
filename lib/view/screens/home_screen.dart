import 'package:flutter/material.dart';

import '../widgets/row_user_data.dart';
import '../widgets/list_tile_widget.dart';
import '../../common/functions/media_query.dart';
import '../../common/widgets/custom_appbat.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: CustomAppBar(
        title: "Home Page",
        height: Media.height(context, space: .09),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: Media.height(context, space: .032)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const RowDataWidget(
                data: "lol",
                icon: Icons.person_outline_outlined,
              ),
              const RowDataWidget(
                data: "lol",
                icon: Icons.phone_android_rounded,
              ),
              const RowDataWidget(
                data: "lol",
                icon: Icons.mail_outline_outlined,
              ),
              ListTileWidget(
                title: "Update Information",
                onTap: () {},
              ),
              ListTileWidget(
                title: "Change Password",
                onTap: () {},
              ),
              ListTileWidget(
                title: "Delete Account",
                onTap: () {},
              ),
              ListTileWidget(
                title: "Logout",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
