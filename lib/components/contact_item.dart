import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ContactItem extends StatelessWidget {
String contact;
String contactName;
IconData contactIcon;

ContactItem({super.key, required this.contact,required this.contactName,required this.contactIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(contactIcon,color: Colors.grey[600]),
        SizedBox(width: 20.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact,style: TextStyle(fontSize:15.sp,color: Colors.grey[500]),),
            Text(contactName,style: TextStyle(color: Colors.grey[400])),
          ],
        )
      ],
    );
  }
}
