import 'package:ap_project_frontend/classes/course.dart';

class Assignment {

  final String _title;

  final Course _course;

  int deadLine;

  bool isActive = true;

  Assignment(this._title, this._course, this.deadLine);

  Course get course => _course;

  String get title => _title;
}