import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tech/backend/controller/courses_controller.dart';

class NoContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor.withOpacity(0.5),
      child: Center(
        child: ListView(
          children: <Widget>[
            Center(
              child: SvgPicture.asset(
                'assets/images/noContent.svg',
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 300.0
                        : 200.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 150,
              child: RaisedButton(
                  onPressed:
                      Provider.of<CourseController>(context).getCourseDetails,
                  color: Colors.deepOrange,
                  child: Text(
                    'Upload Image',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        fontSize: 30.0),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
