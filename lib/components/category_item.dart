import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CategoryItem extends StatelessWidget {
String image;
String name;
void Function()? onTap;
CategoryItem({required this.image,required this.name,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: Colors.grey[100],
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 170.w,
          height: 160.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: 'https://img.freepik.com/free-psd/digital-device-mockup_53876-91374.jpg',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              // Expanded(child: Image.network(image)),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.0.h),
                child: Text(
                  name,
                  style: TextStyle(fontSize: 18.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
