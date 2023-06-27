import 'package:flutter/material.dart';

import '../constant/colors.dart';

class ReusableEmailField extends StatelessWidget {
  String hintText;
  String? labelText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? Function(String?)? validator;
  String? Function(String?)? onSaved;
  // bool? obscureText;
  TextEditingController textEditingController = TextEditingController();

  ReusableEmailField(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      required this.textEditingController,
      this.labelText,
      this.onSaved,
      this.validator})
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
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: TextInputType.emailAddress,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
