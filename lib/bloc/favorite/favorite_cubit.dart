import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:salla/bloc/favorite/favorite_cubit.dart';
import 'package:salla/models/favorite_model.dart';
import 'package:salla/models/product_model.dart';
import 'package:salla/services/dio_helper/dio_helper.dart';
import 'package:salla/services/sp_helper/chach_helper.dart';
import 'package:salla/services/sp_helper/chach_keys.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  List<Product> favoriteProducts = [];

  addToFavorite(Product product) {
    favoriteProducts.add(product);
    product.isFavorite = true;
    emit(FavoriteAddToFavoriteState());
  }

  removeFromFavorite(Product product) {
    favoriteProducts.remove(product);
    product.isFavorite = false;
    emit(FavoriteRemoveFromFavoriteState());
  }
  //
  // FavoriteModel favoriteItems;
  //
  // getFavoriteItems() {
  //   emit(GetFavoriteItemsLoading());
  //   DioHelper.getData(
  //           url: 'view-wish-list',
  //           token: SharedPreferencesHelper.getData(
  //               key: SharedPreferencesKey.token))
  //       .then((value) {
  //         emit(GetFavoriteItemsSuccess());
  //     favoriteItems = FavoriteModel.fromJson(value.data);
  //   }).catchError((error) {
  //     emit(GetFavoriteItemsError());
  //     print(error);
  //   });
  // }
  //
  // addToFavorite(int id) {
  //   DioHelper.postData(url: 'add-to-wish-list/$id', data: {});
  //   emit(FavoriteAddToFavoriteState());
  //
  // }
  //
  // removeFromFavorite(int id) {
  //   DioHelper.deleteData(
  //       url: 'delete-from-wish-list/$id',
  //       token:
  //           SharedPreferencesHelper.getData(key: SharedPreferencesKey.token));
  //   emit(FavoriteRemoveFromFavoriteState());
  // }
}
