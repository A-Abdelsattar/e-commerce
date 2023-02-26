import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCarousel extends StatelessWidget {
   const ImageCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://img.freepik.com/free-psd/smartphone-screen-mockup-psd-promotional-ad_53876-123315.jpg',
      'https://img.freepik.com/free-photo/ethnic-businessman-showing-laptop_23-2147768609.jpg',
      'https://img.freepik.com/free-photo/hands-unrecognizable-man-sitting-wooden-table-cafe-working-laptop_1098-20195.jpg'
      ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
          margin: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 2.w),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
              child: Image.network(item, fit: BoxFit.cover, width: double.infinity)),
        ))
        .toList();
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        enlargeCenterPage: !true,
        enableInfiniteScroll: !false,
        initialPage: 2,
        autoPlay: true,
      ),
      items: imageSliders,
    );

  }
}
