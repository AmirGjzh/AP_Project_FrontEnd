import 'package:ap_project_frontend/classes/course.dart';

class Assignment {

  final String _title;

  final Course _course;

  int _deadLine;

  bool _isActive = false;

  Assignment(this._title, this._course, this._deadLine);
}