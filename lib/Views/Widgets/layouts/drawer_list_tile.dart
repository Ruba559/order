
import 'package:flutter/material.dart';

import '../../../Constants/app_color.dart';
import '../../../Constants/app_text_style.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });

  final String title;
  final IconData iconData;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyle.medium.apply(fontSizeFactor: .8),
      ),
      leading: Icon(
        iconData,
        color: AppColors.veryDarkGrey,
        size: 20,
      ),
      onTap: onTap,
    );
  }
}