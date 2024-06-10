import 'package:ap_project_frontend/classes/student.dart';
import 'package:ap_project_frontend/classes/teacher.dart';
import 'package:ap_project_frontend/classes/assignment.dart';

class Course {

  final String _name;

  final int _units;

  Teacher? _teacher;

  final Map<Student, double> _students = {};

  bool isActive = false;

  final List<Assignment> _exercises = [];

  Assignment? project;

  final int _examDate;

  Course(this._name, this._units, this._examDate);

  int get examDate => _examDate;

  List<Assignment> get exercises => _exercises;

  Map<Student, double> get students => _students;

  Teacher? get teacher => _teacher;

  int get units => _units;

  String get name => _name;
}