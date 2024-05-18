import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()

class  UserModel {
  int id;
  String name;
  String password;

  UserModel({this.id=0,required this.name,required this.password});
}