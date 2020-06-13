import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';

class Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (String emailAddress) {
        Provider.of<CourseController>(context).courseReservation.emailAddress =
            emailAddress;
      },
      validator: emailValidator,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'hint@hint.com',
      ),
    );
  }

  String emailValidator(String value) {
    if (value.contains('@')) {
      return null;
    }
    return 'Enter valid Email';
  }
}
