import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';

class PhoneNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (String phoneNumber) {
        Provider.of<CourseController>(context).courseReservation.phoneNumber =
            phoneNumber;
      },
      validator: numberValidator,
      decoration: InputDecoration(
        labelText: 'Phone number',
        hintText: '01xxxxxxxxx',
      ),
    );
  }

  String numberValidator(String value) {
    if (value.length == 11) {
      return null;
    }
    return 'Enter valid phone Number 01xxxxxxxxx';
  }
}
