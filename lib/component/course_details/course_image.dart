import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';
import 'package:tech/component/custom_image.dart';

import '../../style.dart';

class CourseImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseController>(
      builder: (context, course, child) => Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Carousel(
                images: course.courseData.images
                    .map(
                      (img) => customImage(
                        img,
                      ),
                    )
                    .toList(),
                autoplay: true,
                animationDuration: Duration(seconds: 3),
                dotSize: 4.0,
                dotSpacing: 10.0,
                dotPosition: DotPosition.bottomLeft,
                dotColor: Colors.white,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.transparent,
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.share),
                      color: OnImageIconColor,
                      onPressed: course.shareCourse,
                    ),
                    IconButton(
                      icon: isLikedIcon(context),
                      color: OnImageIconColor,
                      onPressed: course.changeLike,
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    size: 32,
                    color: OnImageIconColor,
                  ),
                  onPressed: () async {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                              content:
                                  Center(child: Text('للعوده للصفحه السابقه')),
                            ));
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  isLikedIcon(BuildContext context) {
    return Icon(Provider.of<CourseController>(context).courseData.isLiked
        ? Icons.star
        : Icons.star_border);
  }
}
