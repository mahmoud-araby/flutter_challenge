import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';

import '../../style.dart';

class CourseHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseController>(
      builder: (context, course, child) => Padding(
        padding: MainPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: CategoryPadding,
              child: Text(
                '# ${course.courseData.interest}',
                style: MainText,
              ),
            ),
            Padding(
              padding: CategoryPadding,
              child: Text(
                course.courseData.title,
                style: TitleText,
              ),
            ),
            Padding(
              padding: CategoryPadding,
              child: textWithIcon(Icons.calendar_today,
                  course.courseData.date.toIso8601String()),
            ),
            textWithIcon(Icons.pin_drop, course.courseData.title),
          ],
        ),
      ),
    );
  }

  Widget textWithIcon(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: IconColor,
        ),
        SizedBox(
          width: IconSpace,
        ),
        Text(
          text,
          style: MainText,
        ),
      ],
    );
  }
}
