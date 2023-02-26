import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla/components/contact_item.dart';
import 'package:salla/components/contact_text_form.dart';
import 'package:salla/src/app_colors.dart';


class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.topRight,
            child: Text('Contact us')),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContactItem(contactName: 'Mobile',contact: '+201155911826',contactIcon: Icons.phone_outlined,),
              SizedBox(height: 20.h,),
              Divider(),
              ContactItem(contactName: 'Home',contact: 'ahmed@gmail.com',contactIcon: Icons.email,),
              SizedBox(height: 20.h,),
              Divider(),
              ContactItem(contactName: 'portable massage',contact: '+201155911821516',contactIcon: Icons.portrait,),
              SizedBox(height: 40.h,),
              Text('Send Massage',style: TextStyle(color: AppColors.kMainColor,fontSize: 20),),
              SizedBox(height: 10.h,),
              ContactTextForm(currentPadding: 1, label: 'Name'),
              ContactTextForm(currentPadding: 1, label: 'Email'),
              ContactTextForm(currentPadding: 10, label: 'Massage'),
            ],
          ),
        ),
      ),
    );
  }
}
