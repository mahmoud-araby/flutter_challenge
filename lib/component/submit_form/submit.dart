import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubmitForm extends StatelessWidget {
  final Function submit;

  SubmitForm(this.submit);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Submit',
        textAlign: TextAlign.center,
      ),
      onPressed: () => submit(context),
    );
  }
}
