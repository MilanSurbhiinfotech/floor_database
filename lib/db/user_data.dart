

import 'package:floor/floor.dart';

@entity
class UserData{

  @primaryKey
  int? id;
  String name;
  String phone;
  UserData({this.id, required this.name, required this.phone});

}