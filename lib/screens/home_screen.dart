import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla/bloc/category/category_cubit.dart';
import 'package:salla/bloc/product/product_cubit.dart';
import 'package:salla/components/category_item.dart';
import 'package:salla/components/product_item.dart';
import 'package:salla/screens/image_carousel.dart';
import 'package:salla/screens/setting_screen.dart';
import 'package:salla/screens/single_product_screen.dart';
import 'package:salla/src/app_colors.dart';
import 'package:salla/utils/app_navigator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubitCategory = CategoryCubit.get(context);
          return SafeArea(
            child: Scaffold(
              key:cubitCategory.globalKey,
              // appBar: AppBar(),
              drawer: SettingScreen(),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                               cubitCategory.globalKey.currentState!.openDrawer();
                              },
                              icon: Icon(Icons.filter_list)),
                          Expanded(
                              child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0.w),
                                  child: Text('Search'),
                                ),
                                suffixIcon: Icon(Icons.search),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 5.h)),
                          ))
                        ],
                      ),
                      ImageCarousel(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0.h,horizontal: 20.w),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 22.sp, color: AppColors.kMainColor),
                        ),
                      ),
                      cubitCategory.allCategories == null
                          ? Center(child: CircularProgressIndicator())
                          : Container(
                              height: 160.h,
                              child: ListView.separated(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      cubitCategory.allCategories!.data!.length,
                                  itemBuilder: (context, index) => CategoryItem(
                                        name: cubitCategory
                                            .allCategories!.data![index].name!,
                                        image:
                                            'https://img.freepik.com/free-psd/digital-device-mockup_53876-91374.jpg',
                                      ),
                                  separatorBuilder: (context, index) => SizedBox(
                                        width: 10.w,
                                      )),
                            ),
                      SizedBox(height: 10.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0.h,horizontal: 20.w),
                        child: Text(
                          "Best Seller",
                          style: TextStyle(
                              fontSize: 22.sp, color: AppColors.kMainColor),
                        ),
                      ),
                      BlocConsumer<ProductCubit, ProductState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            var cubitProduct = ProductCubit.get(context);
                            return cubitProduct.allProducts == null
                                ? Center(child: CircularProgressIndicator())
                                : Container(
                              height: 210.h,
                                    child: ListView.separated(
                                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            ProductItem(
                                              product: cubitProduct.allProducts!.poroducts![index],

                                              image:
                                                  'https://img.freepik.com/free-psd/digital-device-mockup_53876-91374.jpg',

                                              function: () {
                                                AppNavigator.customNavigator(
                                                    context: context,
                                                    screen: SingleProductScreen(
                                                        product: cubitProduct.allProducts!.poroducts![index],),
                                                    finish: false);
                                              },
                                            ),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                        itemCount: 10),
                                  );
                          }),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
