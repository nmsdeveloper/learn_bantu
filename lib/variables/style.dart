import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

textUbuntu({
  required Color color,
  required FontWeight weight,
  required double size,
}) =>
    GoogleFonts.ubuntu(
      color: color,
      fontWeight: weight,
      fontSize: size,
    );

textPoppins({
  required Color color,
  required FontWeight weight,
  required double size,
}) =>
    GoogleFonts.poppins(
      color: color,
      fontWeight: weight,
      fontSize: size,
    );

textGirassol({
  required Color color,
  required FontWeight weight,
  required double size,
}) =>
    GoogleFonts.girassol(
      color: color,
      fontWeight: weight,
      fontSize: size,
    );

bgGradient({
  required Color color1,
  required Color color2,
  height,
  size,
}) =>
    BoxDecoration(
      gradient: LinearGradient(
        colors: [
          color1,
          color2,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: size == null
          ? null
          : BorderRadius.circular(
              height / size,
            ),
    );

bgBoxShadow({
  required double height,
  required Color color,
  required Color colorBox,
  size,
  required double oX,
  required double oY,
  required double bR,
}) =>
    BoxDecoration(
      color: color,
      borderRadius: size == null
          ? null
          : BorderRadius.circular(
              height / size,
            ),
      boxShadow: [
        BoxShadow(
          offset: Offset(oX, oY),
          blurRadius: bR,
          color: colorBox,
        ),
      ],
    );

decoCont({
  required double height,
  color,
  required Color borderColor,
  required double size,
}) =>
    BoxDecoration(
      border: Border.all(
        color: borderColor,
        width: height / 600,
      ),
      color: color,
      borderRadius: BorderRadius.circular(
        height / size,
      ),
    );

contBox({
  required double height,
  required Color color,
  required double size,
}) =>
    BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(
        height / size,
      ),
    );
