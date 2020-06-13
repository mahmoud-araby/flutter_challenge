import 'package:flutter/material.dart';
import 'package:tech/pages/course_resrvation.dart';

import '../../style.dart';

class ReservationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        color: appTheme.accentColor,
        width: double.infinity,
        child: Center(
          child: FlatButton(
              onPressed: () {
                showDialog(
                    context: context, builder: (context) => ReservationForm());
              },
              child: Center(
                  child: Text(
                Reservation,
                style: ButtonStyle,
              ))),
        ),
      ),
    );
  }
}
