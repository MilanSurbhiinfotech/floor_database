// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `UserData` (`id` INTEGER, `name` TEXT NOT NULL, `phone` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get user {
    return _userInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userDataInsertionAdapter = InsertionAdapter(
            database,
            'UserData',
            (UserData item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phone': item.phone
                }),
        _userDataUpdateAdapter = UpdateAdapter(
            database,
            'UserData',
            ['id'],
            (UserData item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phone': item.phone
                }),
        _userDataDeletionAdapter = DeletionAdapter(
            database,
            'UserData',
            ['id'],
            (UserData item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'phone': item.phone
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserData> _userDataInsertionAdapter;

  final UpdateAdapter<UserData> _userDataUpdateAdapter;

  final DeletionAdapter<UserData> _userDataDeletionAdapter;

  @override
  Future<List<UserData>> getAllUsers() async {
    return _queryAdapter.queryList('SELECT * FROM UserData',
        mapper: (Map<String, Object?> row) => UserData(
            id: row['id'] as int?,
            name: row['name'] as String,
            phone: row['phone'] as String));
  }

  @override
  Future<void> addUser(UserData data) async {
    await _userDataInsertionAdapter.insert(data, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(UserData data) async {
    await _userDataUpdateAdapter.update(data, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(UserData data) async {
    await _userDataDeletionAdapter.delete(data);
  }
}
