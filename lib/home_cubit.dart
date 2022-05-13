import 'package:floor/floor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floor/db/app_database.dart';
import 'package:flutter_floor/db/user_data.dart';
import 'package:flutter_floor/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  AppDatabase? database ;
  HomeCubit() : super(HomeInit()){
    _initDB();
  }

  void getUsers() async
  {
    emit(HomeLoading());
    await database?.user.getAllUsers().then((value){
        emit(HomeComplete(value));
    });
  }
  void addUsers(UserData data) async
  {
    await database?.user.addUser(data);
  }

  void updateUsers(UserData data) async
  {
    await database?.user.updateUser(data);
  }

  void deleteUsers(UserData data) async
  {
    await database?.user.deleteUser(data);
  }
  Future<void> _initDB() async{
    $FloorAppDatabase.databaseBuilder("app_database.db").build().then((value){
      database = value;
      getUsers();
    });
  }
}