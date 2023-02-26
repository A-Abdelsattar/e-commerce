import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla/bloc/category/category_cubit.dart';
import 'package:salla/components/category_item.dart';
import 'package:salla/screens/product_by_category_screen.dart';
import 'package:salla/src/app_colors.dart';
import 'package:salla/utils/app_navigator.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit,CategoryState>(listener: (context,state){},builder: (context,state){
      var cubit=CategoryCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.topRight,
              child: Text('Products')),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Products By Category',
                style: TextStyle(color: AppColors.kMainColor, fontSize: 20.sp),
              ),
              SizedBox(height: 10.h,),
              Expanded(
                child: GridView.builder(
                    itemCount: cubit.allCategories!.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 7.0,
                        crossAxisSpacing: 5.0,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) => CategoryItem(
                      onTap: (){
                        AppNavigator.customNavigator(context: context, screen: ProductByCategoryScreen(id:
                        cubit.allCategories!.data![index].id!
                        ), finish: false);
                      },
                        image:
                        'https://img.freepik.com/free-psd/digital-device-mockup_53876-91374.jpg',
                        name: cubit.allCategories!.data![index].name!)),
              )
            ],
          ),
        ),
      );
    } );
  }
}
