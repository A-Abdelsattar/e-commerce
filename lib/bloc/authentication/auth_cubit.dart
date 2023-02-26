import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:salla/bloc/authentication/auth_cubit.dart';
import 'package:salla/models/authentication.dart';
import 'package:salla/services/dio_helper/dio_helper.dart';
import 'package:salla/services/dio_helper/end_points.dart';
import 'package:salla/services/sp_helper/chach_helper.dart';
import 'package:salla/services/sp_helper/chach_keys.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscure=true;
  Authentication? authentication;

  register() {
    emit(RegisterLoadingState());
    DioHelper.postData(url: ApiEndPoints.register, data: {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    }).then((value) {
      emit(RegisterSuccessState());
      authentication = Authentication.fromJson(jsonDecode(value.data));
      SharedPreferencesHelper.saveData(
          key: SharedPreferencesKey.token,
          value: authentication!.data!.accessToken);
      nameController.clear();
      emailController.clear();
      passwordController.clear();
    }).catchError((error) {
      emit(RegisterErrorState());
      print(error);
    });
  }

login(){
    emit(LoginLoadingState());
  DioHelper.postData(url: ApiEndPoints.login, data: {
    'email':emailController.text,
    'password':passwordController.text,
  }).then((value){
    emit(LoginSuccessState());
    authentication=Authentication.fromJson(jsonDecode(value.data));
    SharedPreferencesHelper.saveData(key: SharedPreferencesKey.token, value: authentication!.data!.accessToken);
    emailController.clear();
    passwordController.clear();
  }).catchError((error){
    emit(LoginErrorState());
    print(error.response);
  });
}

showPassword(){
    obscure=!obscure;
    emit(ObscurePasswordState());
}
}