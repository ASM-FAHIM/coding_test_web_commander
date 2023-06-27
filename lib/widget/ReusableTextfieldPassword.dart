import 'package:flutter/material.dart';

import '../constant/colors.dart';

class ReusablePassField extends StatelessWidget {
  String hintText;
  String? labelText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? obscureText;
  String? Function(String?)? onSaved;
  String? Function(String?)? validator;

  TextEditingController textEditingController = TextEditingController();

  ReusablePassField(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      required this.textEditingController,
      this.labelText,
      this.onSaved,
      this.validator,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Roboto',
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.commonColor),
          ),
        ),
        obscureText: obscureText!,
        obscuringCharacter: '*',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
