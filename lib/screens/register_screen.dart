import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salla/bloc/authentication/auth_cubit.dart';
import 'package:salla/components/main_bottom.dart';
import 'package:salla/components/text_field_widget.dart';
import 'package:salla/screens/home_screen.dart';
import 'package:salla/screens/login_screen.dart';
import 'package:salla/src/app_colors.dart';
import 'package:salla/utils/app_navigator.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
   final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if(state is RegisterSuccessState){
            Fluttertoast.showToast(
                msg: AuthCubit.get(context).authentication?.message.toString()??' ',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0
            );
            AppNavigator.customNavigator(context: context, screen: HomeScreen(), finish: false);
          }
          else if(state is RegisterErrorState){
            Fluttertoast.showToast(
                msg: 'not valid name or email or password',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }
        },
        builder: (context, state) {
          var cubit = AuthCubit.get(context);

          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    Image.asset("assets/images/logo.png").image)),
                      ),
                      Text(
                        'Welcome to portatile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.kMainColor,
                            fontSize: 35.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Please sign up to join us',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      TextFieldWidget(
                          label: 'Full name',
                          controller: cubit.nameController,
                          icon: Icons.person),
                      TextFieldWidget(
                          label: 'your email',
                          controller: cubit.emailController,
                          icon: Icons.email),
                      TextFieldWidget(
                        label: 'your password',
                        controller: cubit.passwordController,
                        icon: Icons.lock,
                        isPassword: true,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Align(
                            alignment: AlignmentDirectional.bottomStart,
                            child: TextButton(
                                onPressed: () {},
                                child: Text('forgot password'))),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child:state is RegisterLoadingState?CircularProgressIndicator.adaptive(): MainBottom(
                            functon: () {
                              _globalKey.currentState?.validate();
                              cubit.register();
                            },
                            label: 'Continue'),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: Image.asset(
                              'assets/icons/twitter.png',
                            ).image,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey[200],
                              backgroundImage: Image.asset(
                                'assets/icons/facebook.png',
                              ).image,
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: Image.asset(
                              'assets/icons/gmail.png',
                            ).image,
                          ),
                        ],
                      ),
                      // Spacer(),
                      Text('Don\'t have an account?'),
                      SizedBox(
                        height: 10.h,
                      ),
                      MainBottom(
                          functon: () {
                            AppNavigator.customNavigator(
                                context: context,
                                screen: LoginScreen(),
                                finish: false);
                          },
                          label: 'Sign Up'),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
