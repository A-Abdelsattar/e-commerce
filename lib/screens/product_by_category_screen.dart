import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla/bloc/category/category_cubit.dart';
import 'package:salla/bloc/product/product_cubit.dart';
import 'package:salla/components/category_item.dart';
import 'package:salla/components/product_item.dart';
import 'package:salla/screens/single_product_screen.dart';
import 'package:salla/src/app_colors.dart';
import 'package:salla/utils/app_navigator.dart';

class ProductByCategoryScreen extends StatefulWidget {
  int id;

  ProductByCategoryScreen({super.key, required this.id});

  @override
  State<ProductByCategoryScreen> createState() =>
      _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> {
  @override
  void initState() {
    ProductCubit.get(context).getProductAccordingToCategory(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ProductCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:
                  Align(alignment: Alignment.topRight, child: Text('Products')),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Products By Category',
                    style:
                        TextStyle(color: AppColors.kMainColor, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                   state is GetProductsAccordingLoading?
                  Expanded(child: Center(child: CircularProgressIndicator())):
                   Expanded(
                          child: GridView.builder(
                              itemCount: cubit
                                  .productAccordingToCategory!.poroducts!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.67,
                                      mainAxisSpacing: 7.0,
                                      crossAxisSpacing: 7.0,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) => ProductItem(
                                product: cubit.productAccordingToCategory!.poroducts![index],
                                  image:
                                      "https://img.freepik.com/free-psd/digital-device-mockup_53876-91374.jpg",
                                   function: (){
                                    AppNavigator.customNavigator(context: context, screen: SingleProductScreen(product:cubit.allProducts!.poroducts![index],), finish: false);
                              },)),
                        )
                ],
              ),
            ),
          );
        });
  }
}
