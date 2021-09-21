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

bgGradient() => const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xff36d1dc),
          Color(0xff5b86e5),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
