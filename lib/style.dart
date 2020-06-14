import 'package:flutter/material.dart';

const MainText = TextStyle(
  color: Color(0xFFb9bed1),
  fontSize: 16,
  fontFamily: 'CairoSemiBold',
);

const ConfirmationText = TextStyle(
  color: Color(0xFFBBC0CE),
  fontSize: 16,
  fontFamily: 'CairoBold',
);

const TitleText = TextStyle(
    color: Color(0xFF9ea3b8),
    fontWeight: FontWeight.bold,
    fontSize: 22,
    fontFamily: 'CairoBold');

const HeadingText = TextStyle(
    color: Color(0XFFB8BAD1),
    fontWeight: FontWeight.bold,
    fontSize: 18,
    fontFamily: 'CairoBold');

const ButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
  fontFamily: 'CairoSemiBold',
);

const MainPadding = EdgeInsets.symmetric(horizontal: 18.0);
const CategoryPadding = EdgeInsets.only(bottom: 1.0);

const DividerThickness = 1.4;
const DividerPadding = 4.0;

const IconSpace = 6.0;
const IconColor = Color(0xFFBBC0CE);
const OnImageIconColor = Colors.white;

const Info = "عن الدورة";
const Cost = "تكلفة الدورة";
const OrdinaryCost = "الحجز العادى";
const Reservation = "قم بالحجز الآن";
const Done = "تم الحجز بنجاح";
const UnDone = "حاول فى وقت لاحق";
const Thanks = 'نشكرك';

ThemeData appTheme = ThemeData.light().copyWith(
  accentColor: Color(0xFF8A3CA1),
  primaryColor: Color(0xFFBBC0CE),
);
