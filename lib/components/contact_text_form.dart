import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactTextForm extends StatelessWidget {
int currentPadding;
String label;

ContactTextForm({required this.currentPadding,required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 5.0.h),
      child: TextFormField(
        // minLines: currentPadding,
        maxLines: currentPadding,
        textAlignVertical: TextAlignVertical.top,
        // textAlign: TextAlign.end,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          alignLabelWithHint: true,
            label: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 0),
              child: Text(label,style: TextStyle(color: Colors.grey[400],),),
            ),
            border: OutlineInputBorder(

            ),
            //contentPadding: EdgeInsets.symmetric(vertical: 10.h)
        ),
      ),
    );
  }
}
