import 'package:ap_project_frontend/classes/course.dart';

class Student {
  final String _name;

  final String _lastname;

  String _id;

  String _password;

  int _units = 0;

  final List<Course> courses = [];

  Student(this._name, this._lastname, this._id, this._password);
}