import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static String url = "http://api.devbracket.tech/api/v1";
  //"http://api.devbracket.tech/api/v1";
  //https://api.kiasup.com/api/v1

  static Color yellow = Color(0xFFFFD354);
  static Color blue = Color(0xFF20448F);

  //COLOUR
  static Color grey = Colors.grey;
  static Color white = Color(0xFFFFFFFF);
  static Color transperent = Colors.transparent;

  static Color black = Colors.black;
  static Color orange = Color(0xFFEA985B);
  static Color primaryPink = Color(0xFFF4739E);
  static Color darkPink = Color(0xFFFF4881);

  static Map<String, dynamic> DonorMainColor = {
    "find": {
      "icon": Color(0xFFFA6393),
      "bg": Color(0xFFFA6393).withOpacity(0.4)
    },
    "request": {
      "icon": Color(0xFFF5B800),
      "bg": Color(0xFFF5B800).withOpacity(0.4),
    },
    "bank": {
      "icon": Color(0xFF00CC99),
      "bg": Color(0xFF00CC99).withOpacity(0.4)
    },
    "other": {
      "icon": Color(0xFF999999),
      "bg": Color(0xFF999999).withOpacity(0.4),
    },
    "subTitle": Color(0xFF519FE8)
  };
// F7A1A3
  ///STYLE
  static TextStyle title = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w600,
  );
  static TextStyle Montserrat = GoogleFonts.montserrat();
  static TextStyle Lato = GoogleFonts.lato();
  static TextStyle Roboto = GoogleFonts.roboto();

  static BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Constants.grey));
  ////
  static String nairaSymbol = "₦";

  static String profile =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";

  static Widget gap({double width = 0, double height = 0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
