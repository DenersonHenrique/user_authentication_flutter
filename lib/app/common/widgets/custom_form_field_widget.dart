import 'package:flutter/material.dart';
import 'package:user_authentication_flutter/app/common/constants/app_colors.dart';

class CustomFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? textInputType;
  final bool enabled;
  final bool obscureText;
  final String? Function(String? text)? validator;

  const CustomFormFieldWidget({
    this.controller,
    this.hint,
    this.prefix,
    this.suffix,
    this.textInputType,
    this.enabled = true,
    this.obscureText = false,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: textInputType,
        enabled: enabled,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: prefix,
          suffixIcon: suffix,
          filled: true,
          fillColor: AppColors.materialSwatchColor[200],
          focusColor: AppColors.primaryColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.none,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      );
}
