import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';
import 'package:tech/style.dart';

class NoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'assets/images/noContent.svg',
                color: Theme.of(context).accentColor.withOpacity(0.5),
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 300.0
                        : 200.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: OutlineButton(
                onPressed:
                    Provider.of<CourseController>(context).getCourseDetails,
                color: appTheme.accentColor,
                child: Text(
                  'أعد المحاوله',
                  style: TextStyle(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
