import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salla/bloc/favorite/favorite_cubit.dart';
import 'package:salla/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final function;
  final Product product;

  ProductItem({
    super.key,
    required this.image,
    required this.function,
    required this.product,
  });

  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: InkWell(
        onTap: function,
        child: Container(
          width: 150,
          height: 210.h,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.w,
              color: Color(0XFFEEEEEE),
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Image.network(
                      image,
                      colorBlendMode: BlendMode.clear,
                    ),
                  ),
                  BlocConsumer<FavoriteCubit, FavoriteState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var favoriteCubit = FavoriteCubit.get(context);
                        return Align(
                          alignment: Alignment.topRight,
                          child: Material(
                            shape: CircleBorder(),
                            color: Colors.transparent,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                              onTap: () {
                                if (!product.isFavorite!) {
                                  Fluttertoast.showToast(
                                      msg: 'Added to WishList',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  // favoriteCubit.addToFavorite(product.id!);
                                 favoriteCubit.addToFavorite(product);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Removed  From wishlist',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  // favoriteCubit.removeFromFavorite(product.id!);
                                  favoriteCubit.removeFromFavorite(product);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: product.isFavorite!
                                      ? Colors.red
                                      : Colors.grey[400],
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {
                          //     setState(() {
                          //       favorite = !favorite;
                          //     });
                          //   },
                          //   icon: Icon(
                          //     Icons.favorite,
                          //     color: favorite ? Colors.red : Colors.grey[400],
                          //     size: 30,
                          //   ),
                          // ),
                        );
                      })
                ],
              ),
              Text(product.name!),
              Center(
                child: Text(
                  ('${product.price}'),
                  style: TextStyle(color: Colors.red),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add To Cart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
