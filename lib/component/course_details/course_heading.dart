import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';

import '../../style.dart';

class CourseHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseController>(
      builder: (context, course, child) => Padding(
        padding: MainPadding.copyWith(top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '# ${course.courseData.interest}',
              style: MainText,
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
              child: textWithIcon(
                  Icons.calendar_today,
                  DateFormat('E، dd mmm، kk:mm')
                      .format(course.courseData.date)
                      .toString()),
            ),
            textWithIcon(Icons.pin_drop, course.courseData.address),
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
