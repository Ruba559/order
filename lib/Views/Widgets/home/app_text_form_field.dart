import 'package:flutter/material.dart';
import 'package:order/Constants/app_color.dart';
import 'package:order/Constants/app_style.dart';

import '../../../Constants/app_text_style.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.keyboardType = TextInputType.name,
    this.obsecureText = false,
    this.style = AppTextStyle.body,
    this.textAlign = TextAlign.center,
    this.maxLines = 1,
    this.readOnly = false,
    required this.prefixIcon,
    //  this.formatters,
    this.suffix,
    this.autofocus = false,
    this.onChanged,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obsecureText;
  final TextStyle style;
  final TextAlign textAlign;
  final int maxLines;
  final bool readOnly;
  final Icon prefixIcon;
  // final List<TextInputFormatter>? formatters;
  final Widget? suffix;
  final bool autofocus;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //   inputFormatters: formatters,
      autofocus: autofocus,
      
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,

      decoration: InputDecoration(
        hintText: hintText,
        fillColor: AppColors.lightGrey,
        filled: true,
        prefixIcon: prefixIcon,
        border: const OutlineInputBorder(
          borderRadius: raduis20,
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.solid,
            color: AppColors.darkGrey
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      ),
      onChanged: onChanged,
    );
  }
}
