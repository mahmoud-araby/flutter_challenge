import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../style.dart';

class SubmitForm extends StatelessWidget {
  final Function submit;

  SubmitForm(this.submit);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        'تسجيل',
        textAlign: TextAlign.center,
        style: ButtonStyle,
      ),
      onPressed: () => submit(context),
      color: appTheme.accentColor,
    );
  }
}
