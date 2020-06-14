import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/date_symbol_data_local.dart';
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
                MaterialCommunityIcons.calendar_month_outline,
                getFormatedDate(course.courseData.date),
              ),
            ),
            textWithIcon(Octicons.pin, course.courseData.address),
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

  String getFormatedDate(DateTime time) {
    String formatted = '';
    initializeDateFormatting("ar_SA", null);
    String marker = DateFormat('a').format(time) == 'PM' ? 'مساءاً' : 'صباحاً';
    String formattedTime = DateFormat('h:mm ').format(time);
    var formatter = DateFormat('EEEE, d MMMM, ', 'ar_SA');
    formatted = formatter.format(time);
    return formatted + formattedTime + marker;
  }
}
