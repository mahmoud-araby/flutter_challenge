import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';
import 'package:tech/component/empty_content.dart';
import 'package:tech/component/progress.dart';

class CourseDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Provider.of<CourseController>(context).coursesPageState,
      body: Consumer<CourseController>(
        builder: (context, course, child) {
          if (course.isBusy) {
            return circularProgress();
          } else {
            if (course.courseData == null) {
              return NoContent();
            } else {
              return CoursePage();
            }
          }
        },
      ),
    );
  }
}
