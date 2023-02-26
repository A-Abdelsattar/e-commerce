import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla/bloc/authentication/auth_cubit.dart';
import 'package:salla/bloc/category/category_cubit.dart';
import 'package:salla/bloc/favorite/favorite_cubit.dart';
import 'package:salla/bloc/product/product_cubit.dart';
import 'package:salla/paymab/cubit/cubit_cubit.dart';
import 'package:salla/paymab/screens/kyc_screen.dart';
import 'package:salla/screens/contact_screen.dart';
import 'package:salla/screens/home_screen.dart';
import 'package:salla/screens/login_screen.dart';
import 'package:salla/screens/category_screen.dart';
import 'package:salla/screens/single_product_screen.dart';
import '../screens/on_boarding_screen.dart';


class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context)=>AuthCubit()),
               BlocProvider(create: (context)=>CategoryCubit()..getAllCategories()),
              BlocProvider(create: (context)=>ProductCubit()..getAllProducts()),
              BlocProvider(create: (context)=>FavoriteCubit()),
              // BlocProvider(create: (context)=>PaymentCubit()..getAuthToken())
            ],
            child: MaterialApp(
              home: //ContactScreen(),
              LoginScreen(),
              // SingleProductScreen(id:1),
              //ProductsByCategoryScreen(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.blue,
                appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0,titleTextStyle: TextStyle(color: Colors.black,fontSize: 20),iconTheme: IconThemeData(
                  color: Colors.grey
                )),
              ),
            ),
          );
        });
  }
}

