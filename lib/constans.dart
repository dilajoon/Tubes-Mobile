<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color whiteColor = Color(0xffffffff);
Color textColor = Color(0xff0D0140);
Color secondaryTextColor = Color(0xff524B6B);
Color buttonColor = Color(0xffE6E1FF);
Color primaryButtonColor = Color(0xff130160);
Color tncButtonColor = Color(0xff130160);
Color greyColor = Colors.grey;

TextStyle whiteTextStyle = GoogleFonts.dmSans(
  color: whiteColor,
);
TextStyle textTextStyle = GoogleFonts.dmSans(
  color: textColor,
);
TextStyle secondaryTextStyle = GoogleFonts.dmSans(
  color: secondaryTextColor,
);
TextStyle tncTextStyle = GoogleFonts.dmSans(
  color: tncButtonColor,
);
TextStyle greyTextStyle = GoogleFonts.dmSans(
  color: greyColor,
);

FontWeight bold = FontWeight.bold;
=======
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color whiteColor = Color(0xffffffff);
Color textColor = Color(0xff0D0140);
Color secondaryTextColor = Color(0xff524B6B);
Color buttonColor = Color(0xffE6E1FF);
Color primaryButtonColor = Color(0xff130160);
Color tncButtonColor = Color(0xff130160);
Color greyColor = Colors.grey;
const dangerColor = Color(0xFFDC3444);
const successColor = Color(0xFF28A745);
const warningColor = Color(0xFFF39C12);
const infoColor = Color(0xFF17A2B8);
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

TextStyle whiteTextStyle = GoogleFonts.dmSans(
  color: whiteColor,
);
TextStyle textTextStyle = GoogleFonts.dmSans(
  color: textColor,
);
TextStyle secondaryTextStyle = GoogleFonts.dmSans(
  color: secondaryTextColor,
);
TextStyle tncTextStyle = GoogleFonts.dmSans(
  color: tncButtonColor,
);
TextStyle greyTextStyle = GoogleFonts.dmSans(
  color: greyColor,
);

FontWeight bold = FontWeight.bold;
>>>>>>> 8332ae40505e205f05b12c0ea138b291adffa3f9
