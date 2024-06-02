import 'package:ap_project_frontend/classes/student.dart';
import 'package:ap_project_frontend/classes/teacher.dart';
import 'package:ap_project_frontend/classes/assignment.dart';

class Course {

  final String _name;

  final int _units;

  Teacher? _teacher;

  final Map<Student, double> _students = {};

  bool _isActive = false;

  final List<Assignment> _exercises = [];

  Assignment? _project;

  final String _examDate;

  Course(this._name, this._units, this._examDate);
}