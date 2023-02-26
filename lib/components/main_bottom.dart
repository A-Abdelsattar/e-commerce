import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../src/app_colors.dart';

class MainBottom extends StatelessWidget {
  final functon;
  String label;

  MainBottom({super.key, required this.functon,required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: functon,
      child: Container(
        width: double.infinity,
        height: 45.h,
        color: AppColors.kMainColor,
        child: Center(child: Text(label,style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}
