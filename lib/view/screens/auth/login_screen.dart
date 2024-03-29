import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../widgets/logo_widget.dart';
import '../../../common/routes/pages.dart';
import '../../widgets/rich_text_widget.dart';
import '../../widgets/login_text_fields_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: LogoWidget(
                titleScreen: "Login",
              ),
            ),
            const SliverToBoxAdapter(
              child: LoginTextFieldsWidget(),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: RichTextWidget(
                thinText: 'Don\'t have an account? ',
                boldText: 'Register',
                onTapBoldText: () {
                  Get.offNamed(AppRoute.register);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
