// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class TaskModel extends _TaskModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  TaskModel(
    Uuid id,
    String description, {
    bool completed = false,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<TaskModel>({
        'completed': false,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'completed', completed);
  }

  TaskModel._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, 'id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  bool get completed => RealmObjectBase.get<bool>(this, 'completed') as bool;
  @override
  set completed(bool value) => RealmObjectBase.set(this, 'completed', value);

  @override
  Stream<RealmObjectChanges<TaskModel>> get changes =>
      RealmObjectBase.getChanges<TaskModel>(this);

  @override
  TaskModel freeze() => RealmObjectBase.freezeObject<TaskModel>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TaskModel._);
    return const SchemaObject(ObjectType.realmObject, TaskModel, 'TaskModel', [
      SchemaProperty('id', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('completed', RealmPropertyType.bool),
    ]);
  }
}

class TasBoard extends _TasBoard
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  TasBoard(
    Uuid id,
    String title, {
    bool enable = true,
    Iterable<TaskModel> tasks = const [],
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<TasBoard>({
        'enable': true,
      });
    }
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'enable', enable);
    RealmObjectBase.set<RealmList<TaskModel>>(
        this, 'tasks', RealmList<TaskModel>(tasks));
  }

  TasBoard._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, 'id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  RealmList<TaskModel> get tasks =>
      RealmObjectBase.get<TaskModel>(this, 'tasks') as RealmList<TaskModel>;
  @override
  set tasks(covariant RealmList<TaskModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get enable => RealmObjectBase.get<bool>(this, 'enable') as bool;
  @override
  set enable(bool value) => RealmObjectBase.set(this, 'enable', value);

  @override
  Stream<RealmObjectChanges<TasBoard>> get changes =>
      RealmObjectBase.getChanges<TasBoard>(this);

  @override
  TasBoard freeze() => RealmObjectBase.freezeObject<TasBoard>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TasBoard._);
    return const SchemaObject(ObjectType.realmObject, TasBoard, 'TasBoard', [
      SchemaProperty('id', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('tasks', RealmPropertyType.object,
          linkTarget: 'TaskModel', collectionType: RealmCollectionType.list),
      SchemaProperty('enable', RealmPropertyType.bool),
    ]);
  }
}
