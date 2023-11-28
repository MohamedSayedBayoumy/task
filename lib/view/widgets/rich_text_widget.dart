import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
 
import '../../common/constants/fonts/fonts.dart';

class RichTextWidget extends StatelessWidget {
  final String thinText , boldText;
  final void Function()? onTapBoldText;
  final bool enableUnderlineText;

  const RichTextWidget({
    super.key,
    required this.thinText,
    required this.boldText,
    this.enableUnderlineText = false,
    this.onTapBoldText,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: RichText(
          text: TextSpan(
            text: thinText,
            style: Fonts.mainStyleRegular,
            children: <TextSpan>[
              TextSpan(
                text: boldText,
                recognizer: TapGestureRecognizer()..onTap = onTapBoldText,
                style: Fonts.mainStyleBold.copyWith(
                  decoration: enableUnderlineText == true
                      ? TextDecoration.underline
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
