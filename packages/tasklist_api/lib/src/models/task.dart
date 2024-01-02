//import 'package:equatable/equatable.dart';

class Task {
  final String title;
  final String? description;
  bool isCompleted = false;

  Task(this.title, {this.description, this.isCompleted = false});
}
