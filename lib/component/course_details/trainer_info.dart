import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';

import '../../style.dart';
import '../custom_image.dart';

class TrainerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseController>(
      builder: (context, course, child) => Padding(
        padding: MainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 22,
                  child: customImage(course.courseData.trainer.image),
                  backgroundColor: appTheme.primaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  course.courseData.trainer.name,
                  style: HeadingText,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              course.courseData.trainer.info,
              style: MainText,
            ),
          ],
        ),
      ),
    );
  }
}
