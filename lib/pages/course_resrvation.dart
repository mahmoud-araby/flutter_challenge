import 'package:flutter/material.dart';
import 'package:tech/component/submit_form/email.dart';
import 'package:tech/component/submit_form/name.dart';
import 'package:tech/component/submit_form/phoneNumber.dart';
import 'package:tech/component/submit_form/submit.dart';

class CourseReservation extends StatelessWidget {
  final GlobalKey<FormState> _submitKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        Form(
          key: _submitKey,
          child: Column(
            children: <Widget>[
              Name(),
              PhoneNumber(),
              Email(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SubmitForm(submitForm),
              ),
            ],
          ),
        ),
      ],
    );
  }

  submitForm() {
    if (_submitKey.currentState.validate()) _submitKey.currentState.save();
  }
}
