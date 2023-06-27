import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText({
    Key? key,
    this.color = Colors.black,
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: GoogleFonts.manrope(
        color: color,
        fontWeight: FontWeight.w800,
        fontSize: size == 0 ? Dimensions.fontBigS20 : size,
      ),
    );
  }
}
