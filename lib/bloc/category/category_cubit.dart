import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:salla/models/category_model.dart';
import 'package:salla/models/product_model.dart';
import 'package:salla/services/dio_helper/dio_helper.dart';
import 'package:salla/services/dio_helper/end_points.dart';
import 'package:salla/services/sp_helper/chach_helper.dart';
import 'package:salla/services/sp_helper/chach_keys.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  CategoryModel? allCategories;

  getAllCategories() {
    emit(GetCategoriesLoading());
    DioHelper.getData(
            url: ApiEndPoints.categories,
            token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token))
        .then((value) {
      emit(GetCategoriesSuccess());
      allCategories = CategoryModel.fromJson(jsonDecode(value.data));
    }).catchError((error) {
      emit(GetCategoriesError());
      print(error.toString());
    });
  }

  getCategoryById(int id) {
    emit(GetCategoriesLoading());
    DioHelper.getData(
            url: ApiEndPoints.categories,
            query: {'id': id},
            token: SharedPreferencesHelper.getData(
                key:  SharedPreferencesKey.token)
           )
        .then((value) {
          emit(GetCategoriesSuccess());
      allCategories = CategoryModel.fromJson(jsonDecode(value.data));
    }).catchError((error) {
      emit(GetCategoriesError());
      print(error.toString());
    });
  }


}
