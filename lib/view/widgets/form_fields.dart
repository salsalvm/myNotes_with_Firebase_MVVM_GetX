import 'package:flutter/material.dart';
import 'package:my_notes_with_firebase_mvvm/res/colors.dart';
import 'package:my_notes_with_firebase_mvvm/res/styles.dart';

class CustomFormfield extends StatelessWidget {
  const CustomFormfield({
    Key? key,
    required this.name,
    required this.icon,
    required this.controller,
    required this.validator,
    this.size = 18,
    this.inputTextColor,
    this.fontSize,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);
  final String name;

  final double size;
  final double? fontSize;
  final Color? inputTextColor;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final validator;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      obscuringCharacter: '*',
      style: KStyle.title(),
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: Icon(
          icon,
          size: 25,
        ),
        hintText: name,
        contentPadding: const EdgeInsets.only(left: 20, top: 12),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, color: KColors.kTransperent),
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}
