import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla/screens/category_screen.dart';
import 'package:salla/screens/contact_screen.dart';
import 'package:salla/screens/favorite_screen.dart';
import 'package:salla/screens/login_screen.dart';
import 'package:salla/services/sp_helper/chach_helper.dart';
import 'package:salla/services/sp_helper/chach_keys.dart';
import 'package:salla/src/app_colors.dart';
import 'package:salla/utils/app_navigator.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.kMainColor),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person),
                ),
                SizedBox(width: 15.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Ahmed Abdelsattar',maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          Text(
                            'Edit',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 10.w,),
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 15.r,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
            horizontalTitleGap: 0,
            iconColor: Colors.grey,
            leading: Icon(Icons.shopping_cart_outlined),
            title: Text(
              'Cart',
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Divider(
              thickness: 2,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
            horizontalTitleGap: 0,
            iconColor: Colors.grey,
            leading: Icon(Icons.favorite_border_outlined),
            title: Text(
              'Wish List',
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
            onTap: (){
              AppNavigator.customNavigator(context: context, screen: FavoriteScreen(), finish: false);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Divider(
              thickness: 2,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
            horizontalTitleGap: 0,
            iconColor: Colors.grey,
            leading: Icon(Icons.shopping_bag_outlined),
            title: Text(
              'My Orders',
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Divider(
              thickness: 2,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
            horizontalTitleGap: 0,
            iconColor: Colors.grey,
            leading: Icon(Icons.phone_outlined),
            title: Text(
              'Contact us',
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
            onTap: () {
              AppNavigator.customNavigator(
                  context: context, screen: ContactScreen(), finish: false);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Divider(
              thickness: 2,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
            horizontalTitleGap: 0,
            iconColor: Colors.grey,
            leading: Icon(Icons.expand_circle_down_outlined),
            title: Text(
              'About us',
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Divider(
              thickness: 2,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
            horizontalTitleGap: 0,
            iconColor: Colors.grey,
            leading: Icon(Icons.category_outlined),
            title: Text(
              'Categorise',
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
            onTap: () {
              AppNavigator.customNavigator(
                  context: context, screen: CategoryScreen(), finish: false);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Divider(
              thickness: 2,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 35.w),
            horizontalTitleGap: 0,
            iconColor: Colors.red,
            leading: Icon(Icons.logout),
            title: Text(
              'Log out',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            onTap: () {
              SharedPreferencesHelper.removeData(
                  key: SharedPreferencesKey.token);
              AppNavigator.customNavigator(
                  context: context, screen: LoginScreen(), finish: true);
            },
          ),
        ],
      ),
    );
  }
}
