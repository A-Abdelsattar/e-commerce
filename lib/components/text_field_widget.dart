import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla/bloc/authentication/auth_cubit.dart';

class TextFieldWidget extends StatelessWidget {
  String label;
  IconData icon;
  bool isPassword;

  TextEditingController? controller;

  TextFieldWidget(
      {super.key,
      required this.label,
      required this.icon,
      this.isPassword = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.emailAddress,
            obscureText: cubit.obscure && isPassword,
            decoration: InputDecoration(
              hintText: label,
              prefixIcon: Icon(icon),
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {
                        cubit.showPassword();
                      },
                      icon: cubit.obscure
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.remove_red_eye))
                  : Text(''),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return '$label must not be empty';
              }
            },
          ),
        );
      },
    );
  }
}
