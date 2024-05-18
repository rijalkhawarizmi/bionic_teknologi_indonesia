import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class ChatsModelV3 {
  int id;
  String receiverID;
  String senderID;
  String message;

  ChatsModelV3(
      {this.id = 0,
      required this.receiverID,
      required this.senderID,
      required this.message});
}
