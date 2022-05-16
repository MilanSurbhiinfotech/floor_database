import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/api_services.dart';
import '../validate_mixin.dart';
import 'loginpage_states.dart';

class LoginCubit extends Cubit<LoginState> with Validate{
  LoginCubit() : super(LoginInitState());

  String fcmToken = "1234567890";

  login(String email,String password,String role) async{
    String? deviceId = "1234567890";
    if(isStringEmpty(email)){
      emit(LoginErrorState("Enter email"));
    }else if(isStringEmpty(password)){
      emit(LoginErrorState("Enter password!"));
    }else{
      emit(LoginLoadingState());
      ApiServices().login(email,password,role,fcmToken).then((value) async {
        if(value.data.code == 200){

          emit(LoginErrorState(value.data.message.toString()));

        }else{
          emit(LoginErrorState(value.data.message.toString()));
        }
      });
    }
  }
}