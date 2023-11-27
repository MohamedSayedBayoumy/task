import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../common/routes/pages.dart';
import '../../widgets/logo_widget.dart';
import '../../widgets/rich_text_widget.dart';
import '../../widgets/regiester_text_fileds_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: LogoWidget(
                titleScreen: "Register",
              ),
            ),
            SliverToBoxAdapter(
              child: RegsiterTextFieldsWidget(),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: RichTextWidget(
                thinText: 'Already have an account? ',
                boldText: 'login',
                onTapBoldText: () {
                  Get.offNamed(AppRoute.login);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
