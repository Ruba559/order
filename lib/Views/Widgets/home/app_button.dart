import 'package:flutter/material.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_style.dart';
import '../../../Constants/app_text_style.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.color});

  final String text;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const RoundedRectangleBorder(borderRadius: raduis20),
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 40),
      onPressed: onTap,
      color: color,
      child: Text(
        text,
        style: AppTextStyle.body.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
