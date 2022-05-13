
import 'package:floor/floor.dart';
import 'package:flutter_floor/db/user_data.dart';

@dao
abstract class UserDao{

  @Query('SELECT * FROM UserData')
  Future<List<UserData>> getAllUsers();

  @insert
  Future<void> addUser(UserData data);

  @delete
  Future<void> deleteUser(UserData data);

  @update
  Future<void> updateUser(UserData data);
}