import 'package:ap_project_frontend/classes/course.dart';

class Teacher {

  final String _name;

  final String _lastname;

  final String _sername;

  String? _password;

  List<Course> _courses = [];

  Teacher(this._name, this._lastname, this._sername, this._password);
}