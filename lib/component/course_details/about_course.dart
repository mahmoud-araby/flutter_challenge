import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';

import '../../style.dart';

class AboutCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseController>(
      builder: (context, course, child) => Padding(
        padding: MainPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Info,
              style: HeadingText,
            ),
            Text.rich(
              TextSpan(text: course.courseData.occasionDetail),
              style: MainText,
            ),
          ],
        ),
      ),
    );
  }
}
