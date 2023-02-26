import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla/bloc/favorite/favorite_cubit.dart';
import 'package:salla/components/product_item.dart';
import 'package:salla/utils/app_navigator.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Align(alignment: Alignment.topRight, child: Text('WishList')),
      ),
      body: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = FavoriteCubit.get(context);
          return BuildCondition(
            condition: cubit.favoriteProducts.isNotEmpty,
            fallback: (context) => Center(
                child: Center(child: Text('Wish list is empty',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp,color: Colors.grey),),)),
            builder: (context) => Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.67,
                        mainAxisSpacing: 7.0,
                        crossAxisSpacing: 7.0,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.favoriteProducts.length,
                      itemBuilder: (context, index) {
                        return ProductItem(
                          product: cubit.favoriteProducts[index],
                          image:
                              'https://img.freepik.com/free-psd/digital-device-mockup_53876-91374.jpg',
                          function: () {},
                        );
                      }),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
