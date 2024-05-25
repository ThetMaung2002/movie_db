import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUI extends StatelessWidget {
  const TextUI(
      {super.key,
      required this.label,
      this.fontSize,
      this.fontWeight,
      this.color});

  final String label;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.notoSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
