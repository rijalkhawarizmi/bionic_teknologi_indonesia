import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()

class  UserIDModel {
  int id;
  String userID;

  UserIDModel({this.id=0,required this.userID});
}