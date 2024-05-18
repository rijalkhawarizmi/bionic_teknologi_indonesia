// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()

class TaskModel {
  int id;
  String? title;
  String? description;
  TaskModel({
    this.id=0,
     this.title,
     this.description,
  });
}
