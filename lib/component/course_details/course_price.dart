import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';

import '../../style.dart';

class CoursePrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseController>(
      builder: (context, course, child) => Padding(
        padding: MainPadding.copyWith(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: CategoryPadding,
              child: Text(
                Cost,
                style: HeadingText,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  OrdinaryCost,
                  style: MainText,
                ),
                Text(
                  course.courseData.price.toString() + ' SAR',
                  style: MainText,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
