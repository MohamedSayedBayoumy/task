import 'package:flutter/material.dart';

abstract class Media {
  static width(BuildContext context, {double? space = 1}) =>
      MediaQuery.sizeOf(context).width * space!;

  static height(BuildContext context, {double? space = 1}) =>
      MediaQuery.sizeOf(context).height * space!;
}
