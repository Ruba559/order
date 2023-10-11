import 'package:flutter/material.dart';

import '../../../Constants/app_style.dart';
import '../../../Constants/app_text_style.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String text;
  final Function() onTap;
  final Color color;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: raduis20,
          color: color
          
        ),
        width: 120,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Icon(
              icon,
              size: 18,
            ),
            Text(
             text,
              style: AppTextStyle.xsmall,
            ),
          ],
        ),
      ),
    );
  }
}
