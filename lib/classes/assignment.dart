import 'package:ap_project_frontend/classes/course.dart';

class Assignment {

  final String title;

  final Course course;

  int deadLine;

  bool isActive = true;

  Assignment(this.title, this.course, this.deadLine);

}