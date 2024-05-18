import 'package:bionic_teknologi_indonesia/main.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/models/chatv3_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../models/userID_model.dart';
import '../models/user_model.dart';

class ChatsController extends GetxController {
  late Stream<List<UserModel>> streamUser;
  late Stream<List<ChatsModelV3>> streamChat;
  String? myID;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    streamUser = getUsers();
    myID=getMyID()?.userID;
  }

  Future<bool> signUp(String name, String password) async {
    update();
    bool result = await objectBox.signup(name, password);
    return result;
  }

  Future<UserModel?> signIn(String name, String password) async {
    update();
    final result = await objectBox.signin(name, password);
    return result;
  }

  Stream<List<UserModel>> getUsers() {
    update();
    return objectBox.getUsers();
  }

  int createChats(ChatsModelV3 chatsModel) {
    update();
    final result = objectBox.createChats(chatsModel);
    return result;
  }

  Stream<List<ChatsModelV3>> getListChats(String userID, String otherUserID) {
    return objectBox.getListChats(userID, otherUserID);
  }

  UserIDModel? getMyID() {
    update();
    return objectBox.getMyID();
    
  }
}
