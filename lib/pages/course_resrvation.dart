import 'package:flutter/material.dart';
import 'package:tech/component/submit_form/email.dart';
import 'package:tech/component/submit_form/name.dart';
import 'package:tech/component/submit_form/phoneNumber.dart';
import 'package:tech/component/submit_form/submit.dart';

import 'confirmation.dart';

class ReservationForm extends StatelessWidget {
  final GlobalKey<FormState> _submitKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      elevation: 15,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
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
        ),
      ],
    );
  }

  submitForm(BuildContext context) {
    //  if (_submitKey.currentState.validate()) {
    _submitKey.currentState.save();
    Navigator.pop(context);
    showDialog(context: context, builder: (context) => ConfirmSubmit());
    //  }
  }
}
