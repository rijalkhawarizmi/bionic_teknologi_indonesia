import 'dart:convert';
import 'dart:io';

import 'package:bionic_teknologi_indonesia/main.dart';
import 'package:bionic_teknologi_indonesia/src/number_2/model/task_model.dart';
import 'package:bionic_teknologi_indonesia/src/number_3/models/chatv3_model.dart';
import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';

import '../../objectbox.g.dart';
import '../../src/number_2/model/contact_model.dart';
import '../../src/number_3/models/chats_model.dart';
import '../../src/number_3/models/userID_model.dart';
import '../../src/number_3/models/user_model.dart';

class ObjectBox {
  late final Store _store;
  late final Box<TaskModel> _taskModelBox;
  late final Box<ImageModel> _imageModelBox;
  late final Box<UserModel> _userModelBox;
  late final Box<ChatsModelV3> _chatsModelBox;
  late final Box<UserIDModel> _userIDModel;
  ObjectBox._init(this._store) {
    _taskModelBox = Box<TaskModel>(_store);
    _imageModelBox = Box<ImageModel>(_store);
    _userModelBox = Box<UserModel>(_store);
    _chatsModelBox = Box<ChatsModelV3>(_store);
    _userIDModel = Box<UserIDModel>(_store);
  }
  static Future<ObjectBox> init() async {
    final store = await openStore();

    if (Sync.isAvailable()) {
      final syncs =
          Sync.client(store, "ws://0.0.0.0:9999", SyncCredentials.none());
      syncs.start();
    }
    // await store.box<ChatsModel>().sync();
    return ObjectBox._init(store);
  }

  TaskModel? getTaskById(int id) => _taskModelBox.get(id);

  Stream<List<TaskModel>> getTask() => _taskModelBox
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());

  int createTask(TaskModel taskModel) => _taskModelBox.put(taskModel);

  bool deleteTask(int id) => _taskModelBox.remove(id);

  ImageModel? getImage(int id) => _imageModelBox.get(id);

  Stream<List<ImageModel>> getImages() => _imageModelBox
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());

  int createImage(ImageModel imageModel) => _imageModelBox.put(imageModel);

  bool deleteImage(int id) => _imageModelBox.remove(id);

  // int createUser(UserModel userModel)=>_userModelBox.put(userModel);

  Future<bool> signup(String name, String password) async {
    final existingUser =
        _userModelBox.query(UserModel_.name.equals(name)).build().findFirst();
    if (existingUser != null) {
      return false;
    } else {
      final bytes = utf8.encode(password);
      final hashedPassword = sha256.convert(bytes).toString();
      final user = UserModel(name: name, password: hashedPassword);
      _userModelBox.put(user);
      saveUserMyID(UserIDModel(userID: user.name));
      return true;
    }
  }

  Stream<List<UserModel>> getUsers() => _userModelBox
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());

  Future<UserModel?> signin(String name, String password) async {
    final bytes = utf8.encode(password);
    final hashedPassword = sha256.convert(bytes).toString();
    final user = _userModelBox
        .query(UserModel_.name
            .equals(name)
            .and(UserModel_.password.equals(hashedPassword)))
        .build()
        .findFirst();
    saveUserMyID(UserIDModel(userID: user?.name ?? "unknown"));
    return user;
  }

  Stream<List<ChatsModelV3>> getListChats(String userId1, String userId2) {
    final query = _chatsModelBox
        .query((ChatsModelV3_.senderID.equals(userId1) &
                ChatsModelV3_.receiverID.equals(userId2)) |
            (ChatsModelV3_.senderID.equals(userId2) &
                ChatsModelV3_.receiverID.equals(userId1)))
        .watch(triggerImmediately: true).map((query) => query.find());
       
    return query;
  }

  int createChats(ChatsModelV3 chatsModel) => _chatsModelBox.put(chatsModel);

  bool deleteUser(int id) => _userModelBox.remove(id);

  void saveUserMyID(UserIDModel user) {
    
     _userIDModel.removeAll();
    _userIDModel.put(user);
  }

  UserIDModel? getMyID() {
    final users = _userIDModel.getAll();
    return users.isNotEmpty ? users.first : null;
  }

}
