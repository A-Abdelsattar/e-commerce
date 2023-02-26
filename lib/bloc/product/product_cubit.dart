import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:salla/bloc/category/category_cubit.dart';
import 'package:salla/models/product_model.dart';
import 'package:salla/services/dio_helper/dio_helper.dart';
import 'package:salla/services/dio_helper/end_points.dart';
import 'package:salla/services/sp_helper/chach_helper.dart';
import 'package:salla/services/sp_helper/chach_keys.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());


  static ProductCubit get(context) => BlocProvider.of(context);


  ProductModel? allProducts;

  getAllProducts() {
    emit(GetProductsLoading());
    DioHelper.getData(
        url: ApiEndPoints.products,
        token: SharedPreferencesHelper.getData(
            key: SharedPreferencesKey.token)
    )
        .then((value) {
      emit(GetProductsSuccess());
      allProducts = ProductModel.fromJson(jsonDecode(value.data));
    }).catchError((error) {
      emit(GetProductsError());
      print(error.toString());
    });
  }
  ProductModel? productAccordingToCategory;
  
  getProductAccordingToCategory(int id){
    emit(GetProductsAccordingLoading());
    DioHelper.getData(url: 'product',query:{
      'category':id
    },
      token: SharedPreferencesHelper.getData(key: SharedPreferencesKey.token)
    ).then((value) {
      emit(GetProductsAccordingSuccess());
      productAccordingToCategory=ProductModel.fromJson(jsonDecode(value.data));
    }).catchError((error){
      emit(GetProductsAccordingError());
      print(error);
    });
  }
}
