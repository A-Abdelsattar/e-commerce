import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(

        children: [
          SizedBox(height: 100.h,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Image(
              image: AssetImage('assets/images/onboarding1.png'),
            ),
          ),
          SizedBox(height: 60.h,),
          Text('     Browse the menu\n and order directly from\n        the application',style: TextStyle(fontSize: 25.sp),)
        ],
      ),
    );
  }
}
