import 'package:flutter/material.dart';
import 'package:tech/backend/modules/course_module.dart';

class CourseController extends ChangeNotifier {
  bool isBusy = false;
  Course courseData;
}
