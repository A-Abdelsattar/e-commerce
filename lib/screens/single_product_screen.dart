import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla/bloc/product/product_cubit.dart';
import 'package:salla/components/main_bottom.dart';
import 'package:salla/models/product_model.dart';

class SingleProductScreen extends StatelessWidget {
  Product product;
   SingleProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProductCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Align(
                alignment: Alignment.topRight,
                child: Text(product.name??' ')),
            actions: [Icon(Icons.shopping_cart)],
          ),
          body: Column(
            children: [
              Image.network(
                'https://img.freepik.com/free-psd/digital-device-mockup_53876-91374.jpg',
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.all(15.r),
                child: Row(
                  children: [
                    Text(
                      product.name??' ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    ),
                    Spacer(),
                    Text(
                      '${product.price}',
                      style: TextStyle(color: Colors.red, fontSize: 18.sp),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Text(
                  'ankdaniandjnndksannansdfghjklfghjklghjklghjkl;bhnjmk,lvbhjnmk,lvbhnjmk,fgbnjmk,lvgbnjmk,lfvgbhmk,gbhnjmcfvbhjnmklvgbhnjm',
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
              Spacer(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                child: MainBottom(functon: () {}, label: 'Add To Cart'),
              ),
            ],
          ),
        );
      },
    );
  }
}
