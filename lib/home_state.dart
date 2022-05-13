
import 'package:flutter_floor/db/user_data.dart';

abstract class HomeState{}

class HomeInit extends HomeState{}

class HomeLoading extends HomeState{}

class HomeComplete extends HomeState{

  List<UserData> userList;
  HomeComplete(this.userList);
}