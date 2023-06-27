import 'package:flutter/material.dart';
import 'package:web_commander_code_test/constant/colors.dart';

class GlobalButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final bool isRounded;
  final double? btnHeight;
  final int roundedBorderRadius;
  final Color? btnBackgroundActiveColor;
  final double? textFontSize;

  GlobalButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.isRounded = true,
    this.btnHeight,
    this.roundedBorderRadius = 17,
    this.btnBackgroundActiveColor,
    this.textFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color btnColor = btnBackgroundActiveColor ?? AppColor.commonColor;

    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (states) {
            return RoundedRectangleBorder(
              borderRadius:
                  isRounded ? BorderRadius.circular(10.0) : BorderRadius.zero,
            );
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) =>
              onPressed != null ? btnColor : Colors.grey,
        ),
        elevation: MaterialStateProperty.resolveWith(
          (states) => 0.0,
        ),
      ),
      onPressed: onPressed,
      child: Container(
        height: btnHeight ?? 55,
        child: Center(
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}
