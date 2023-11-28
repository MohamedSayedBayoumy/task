import 'package:flutter/material.dart';

class LoadingHomeScreenWidget extends StatelessWidget {
  const LoadingHomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.grey.shade400,
        strokeWidth: 1,
      ),
    );
  }
}
