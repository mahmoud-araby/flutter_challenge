import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';

import '../component/course_details/about_course.dart';
import '../component/course_details/course_heading.dart';
import '../component/course_details/course_image.dart';
import '../component/course_details/course_price.dart';
import '../component/course_details/reserve_button.dart';
import '../component/course_details/trainer_info.dart';
import '../component/empty_content.dart';
import '../component/progress.dart';
import '../style.dart';

class CourseDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Provider.of<CourseController>(context).detailPageScaffold,
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

class CoursePage extends StatelessWidget {
  double platformHeight = 0;
  double platformWidth = 0;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      platformHeight = MediaQuery.of(context).size.height;
      platformWidth = MediaQuery.of(context).size.width - 23;
    } else {
      platformWidth = MediaQuery.of(context).size.height - 23;
      platformHeight = MediaQuery.of(context).size.width;
    }
    return Consumer<CourseController>(
      builder: (context, course, child) => CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: checkPortrait(context)
            ? portraitMode(context)
            : landscapeMode(context),
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DividerPadding),
      child: Divider(
        thickness: DividerThickness,
      ),
    );
  }

  bool checkPortrait(BuildContext context) {
    return MediaQuery.of(context).size.width < 400;
  }

  List<Widget> landscapeMode(BuildContext context) {
    return [
      SliverAppBar(
        backgroundColor: Colors.white,
        expandedHeight: platformWidth,
        flexibleSpace: FlexibleSpaceBar(
          background: Row(
            children: <Widget>[
              Expanded(child: CourseImages()),
              RefreshIndicator(
                onRefresh:
                    Provider.of<CourseController>(context).getCourseDetails,
                child: SingleChildScrollView(
                  child: Container(
                    width: platformHeight * 0.4,
                    child: Column(
                      children: <Widget>[
                        CourseHeading(),
                        divider(),
                        TrainerInfo(),
                        divider(),
                        AboutCourse(),
                        divider(),
                        CoursePrice(),
                        ReservationButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> portraitMode(BuildContext context) {
    return <Widget>[
      SliverAppBar(
        expandedHeight: 210,
        flexibleSpace: FlexibleSpaceBar(
          background: CourseImages(),
        ),
      ),
      SliverFixedExtentList(
        itemExtent: platformHeight - 230,
        delegate: SliverChildListDelegate([
          RefreshIndicator(
            onRefresh: Provider.of<CourseController>(context).getCourseDetails,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CourseHeading(),
                  divider(),
                  TrainerInfo(),
                  divider(),
                  AboutCourse(),
                  divider(),
                  CoursePrice(),
                  ReservationButton(),
                ],
              ),
            ),
          ),
        ]),
      ),
    ];
  }
}
