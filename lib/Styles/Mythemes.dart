import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mythemes {
  static Color brimaryColour = Color(0xff5D9CEC);
  static Color blackColour = Color(0xff242424);

  static ThemeData lightTheme = ThemeData(



      textTheme: TextTheme(
        bodySmall: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w400, color: blackColour),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: Color(0xff242424),
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: blackColour,
        ),
      ),
      scaffoldBackgroundColor: Color(0xffDFECDB),
      appBarTheme: AppBarTheme(
        color: brimaryColour,
        iconTheme: IconThemeData(color: Colors.white, size: 20),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
type: BottomNavigationBarType.fixed,
        selectedItemColor: brimaryColour,
        unselectedItemColor: Color(0xffC8C9CB),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ));
  static ThemeData darkTheme = ThemeData(

      textTheme: TextTheme(
        bodySmall: GoogleFonts.poppins(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: Color(0xffFACC1D),
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white, size: 20),
        elevation: 0.0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Color(0xffFACC1D),
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xff141A2E),
      ));


}
