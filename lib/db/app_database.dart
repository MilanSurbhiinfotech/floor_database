
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_floor/db/user_dao.dart';
import 'package:flutter_floor/db/user_data.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';


@Database(version: 1, entities: [UserData])
abstract class AppDatabase extends FloorDatabase{
  UserDao get user;
}