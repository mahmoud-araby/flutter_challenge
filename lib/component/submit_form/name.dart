import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';

class Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (String name) {
        Provider.of<CourseController>(context).courseReservation.name = name;
      },
      validator: nameValidator,
      decoration: InputDecoration(
        labelText: 'Name',
        hintText: 'John s',
      ),
    );
  }

  String nameValidator(String value) {
    if (value.length > 3) {
      return null;
    }
    return 'Enter valid Name';
  }
}
