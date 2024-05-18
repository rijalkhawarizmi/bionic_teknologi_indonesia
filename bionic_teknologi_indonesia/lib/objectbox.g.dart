// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_sync_flutter_libs/objectbox_sync_flutter_libs.dart';

import 'src/number_2/model/contact_model.dart';
import 'src/number_2/model/task_model.dart';
import 'src/number_3/models/chats_model.dart';
import 'src/number_3/models/chatv3_model.dart';
import 'src/number_3/models/userID_model.dart';
import 'src/number_3/models/user_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 310572389247536522),
      name: 'TaskModel',
      lastPropertyId: const obx_int.IdUid(3, 5908348806048990934),
      flags: 2,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8418276300408807534),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3849559063703519245),
            name: 'title',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 5908348806048990934),
            name: 'description',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 5225682617338499382),
      name: 'ImageModel',
      lastPropertyId: const obx_int.IdUid(3, 4255720751674659797),
      flags: 2,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 3204981667961158106),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1905381739798319961),
            name: 'imagePath',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 4255720751674659797),
            name: 'isVideo',
            type: 1,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(6, 648625342390059944),
      name: 'UserModel',
      lastPropertyId: const obx_int.IdUid(3, 352049698889079675),
      flags: 2,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6818119874532904552),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 640931316881839434),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 352049698889079675),
            name: 'password',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(7, 1813588987888516442),
      name: 'UserIDModel',
      lastPropertyId: const obx_int.IdUid(2, 1262117086931370085),
      flags: 2,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 6080533263287532581),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1262117086931370085),
            name: 'userID',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(8, 4389773619929022230),
      name: 'ChatsModelV2',
      lastPropertyId: const obx_int.IdUid(4, 287318068416120251),
      flags: 2,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1785389456792643430),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 3807125820262333020),
            name: 'receiverID',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 7732765994503914247),
            name: 'senderID',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 287318068416120251),
            name: 'message',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(9, 6249889188348131040),
      name: 'ChatsModelV3',
      lastPropertyId: const obx_int.IdUid(4, 839915955374939571),
      flags: 2,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4064272164013398949),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1075299431366397129),
            name: 'receiverID',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 9053623488767467387),
            name: 'senderID',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 839915955374939571),
            name: 'message',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(9, 6249889188348131040),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [
        8759690609503944261,
        5247314367308841599,
        6844563363646709142
      ],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        2339120546953142572,
        8613014349384085462,
        3982807267790391478,
        2980781088438940770,
        291974459289084848,
        4457131993930890904,
        5757572835106932480,
        4215520392607121125,
        9170134467368116725,
        8057561309381788280,
        3746075442724618118
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    TaskModel: obx_int.EntityDefinition<TaskModel>(
        model: _entities[0],
        toOneRelations: (TaskModel object) => [],
        toManyRelations: (TaskModel object) => {},
        getId: (TaskModel object) => object.id,
        setId: (TaskModel object, int id) {
          object.id = id;
        },
        objectToFB: (TaskModel object, fb.Builder fbb) {
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title!);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addOffset(2, descriptionOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 6);
          final descriptionParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8);
          final object = TaskModel(
              id: idParam, title: titleParam, description: descriptionParam);

          return object;
        }),
    ImageModel: obx_int.EntityDefinition<ImageModel>(
        model: _entities[1],
        toOneRelations: (ImageModel object) => [],
        toManyRelations: (ImageModel object) => {},
        getId: (ImageModel object) => object.id,
        setId: (ImageModel object, int id) {
          object.id = id;
        },
        objectToFB: (ImageModel object, fb.Builder fbb) {
          final imagePathOffset = fbb.writeString(object.imagePath);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, imagePathOffset);
          fbb.addBool(2, object.isVideo);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final imagePathParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final isVideoParam =
              const fb.BoolReader().vTableGet(buffer, rootOffset, 8, false);
          final object = ImageModel(
              id: idParam, imagePath: imagePathParam, isVideo: isVideoParam);

          return object;
        }),
    UserModel: obx_int.EntityDefinition<UserModel>(
        model: _entities[2],
        toOneRelations: (UserModel object) => [],
        toManyRelations: (UserModel object) => {},
        getId: (UserModel object) => object.id,
        setId: (UserModel object, int id) {
          object.id = id;
        },
        objectToFB: (UserModel object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final passwordOffset = fbb.writeString(object.password);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, passwordOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final passwordParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final object =
              UserModel(id: idParam, name: nameParam, password: passwordParam);

          return object;
        }),
    UserIDModel: obx_int.EntityDefinition<UserIDModel>(
        model: _entities[3],
        toOneRelations: (UserIDModel object) => [],
        toManyRelations: (UserIDModel object) => {},
        getId: (UserIDModel object) => object.id,
        setId: (UserIDModel object, int id) {
          object.id = id;
        },
        objectToFB: (UserIDModel object, fb.Builder fbb) {
          final userIDOffset = fbb.writeString(object.userID);
          fbb.startTable(3);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, userIDOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final userIDParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final object = UserIDModel(id: idParam, userID: userIDParam);

          return object;
        }),
    ChatsModelV2: obx_int.EntityDefinition<ChatsModelV2>(
        model: _entities[4],
        toOneRelations: (ChatsModelV2 object) => [],
        toManyRelations: (ChatsModelV2 object) => {},
        getId: (ChatsModelV2 object) => object.id,
        setId: (ChatsModelV2 object, int id) {
          object.id = id;
        },
        objectToFB: (ChatsModelV2 object, fb.Builder fbb) {
          final receiverIDOffset = fbb.writeString(object.receiverID);
          final senderIDOffset = fbb.writeString(object.senderID);
          final messageOffset = fbb.writeString(object.message);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, receiverIDOffset);
          fbb.addOffset(2, senderIDOffset);
          fbb.addOffset(3, messageOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final receiverIDParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final senderIDParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final messageParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final object = ChatsModelV2(
              id: idParam,
              receiverID: receiverIDParam,
              senderID: senderIDParam,
              message: messageParam);

          return object;
        }),
    ChatsModelV3: obx_int.EntityDefinition<ChatsModelV3>(
        model: _entities[5],
        toOneRelations: (ChatsModelV3 object) => [],
        toManyRelations: (ChatsModelV3 object) => {},
        getId: (ChatsModelV3 object) => object.id,
        setId: (ChatsModelV3 object, int id) {
          object.id = id;
        },
        objectToFB: (ChatsModelV3 object, fb.Builder fbb) {
          final receiverIDOffset = fbb.writeString(object.receiverID);
          final senderIDOffset = fbb.writeString(object.senderID);
          final messageOffset = fbb.writeString(object.message);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, receiverIDOffset);
          fbb.addOffset(2, senderIDOffset);
          fbb.addOffset(3, messageOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final receiverIDParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final senderIDParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final messageParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final object = ChatsModelV3(
              id: idParam,
              receiverID: receiverIDParam,
              senderID: senderIDParam,
              message: messageParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [TaskModel] entity fields to define ObjectBox queries.
class TaskModel_ {
  /// See [TaskModel.id].
  static final id =
      obx.QueryIntegerProperty<TaskModel>(_entities[0].properties[0]);

  /// See [TaskModel.title].
  static final title =
      obx.QueryStringProperty<TaskModel>(_entities[0].properties[1]);

  /// See [TaskModel.description].
  static final description =
      obx.QueryStringProperty<TaskModel>(_entities[0].properties[2]);
}

/// [ImageModel] entity fields to define ObjectBox queries.
class ImageModel_ {
  /// See [ImageModel.id].
  static final id =
      obx.QueryIntegerProperty<ImageModel>(_entities[1].properties[0]);

  /// See [ImageModel.imagePath].
  static final imagePath =
      obx.QueryStringProperty<ImageModel>(_entities[1].properties[1]);

  /// See [ImageModel.isVideo].
  static final isVideo =
      obx.QueryBooleanProperty<ImageModel>(_entities[1].properties[2]);
}

/// [UserModel] entity fields to define ObjectBox queries.
class UserModel_ {
  /// See [UserModel.id].
  static final id =
      obx.QueryIntegerProperty<UserModel>(_entities[2].properties[0]);

  /// See [UserModel.name].
  static final name =
      obx.QueryStringProperty<UserModel>(_entities[2].properties[1]);

  /// See [UserModel.password].
  static final password =
      obx.QueryStringProperty<UserModel>(_entities[2].properties[2]);
}

/// [UserIDModel] entity fields to define ObjectBox queries.
class UserIDModel_ {
  /// See [UserIDModel.id].
  static final id =
      obx.QueryIntegerProperty<UserIDModel>(_entities[3].properties[0]);

  /// See [UserIDModel.userID].
  static final userID =
      obx.QueryStringProperty<UserIDModel>(_entities[3].properties[1]);
}

/// [ChatsModelV2] entity fields to define ObjectBox queries.
class ChatsModelV2_ {
  /// See [ChatsModelV2.id].
  static final id =
      obx.QueryIntegerProperty<ChatsModelV2>(_entities[4].properties[0]);

  /// See [ChatsModelV2.receiverID].
  static final receiverID =
      obx.QueryStringProperty<ChatsModelV2>(_entities[4].properties[1]);

  /// See [ChatsModelV2.senderID].
  static final senderID =
      obx.QueryStringProperty<ChatsModelV2>(_entities[4].properties[2]);

  /// See [ChatsModelV2.message].
  static final message =
      obx.QueryStringProperty<ChatsModelV2>(_entities[4].properties[3]);
}

/// [ChatsModelV3] entity fields to define ObjectBox queries.
class ChatsModelV3_ {
  /// See [ChatsModelV3.id].
  static final id =
      obx.QueryIntegerProperty<ChatsModelV3>(_entities[5].properties[0]);

  /// See [ChatsModelV3.receiverID].
  static final receiverID =
      obx.QueryStringProperty<ChatsModelV3>(_entities[5].properties[1]);

  /// See [ChatsModelV3.senderID].
  static final senderID =
      obx.QueryStringProperty<ChatsModelV3>(_entities[5].properties[2]);

  /// See [ChatsModelV3.message].
  static final message =
      obx.QueryStringProperty<ChatsModelV3>(_entities[5].properties[3]);
}
