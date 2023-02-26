import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/paymab/cubit/cubit_cubit.dart';
import 'package:salla/paymab/cubit/cubit_state.dart';
import 'package:salla/paymab/widgets/default_button.dart';
import 'package:salla/paymab/widgets/default_text_form_field.dart';
import 'package:salla/src/app_colors.dart';


class KYCScreen extends StatelessWidget {
  KYCScreen({Key? key}) : super(key: key);
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Integration'),
        backgroundColor: AppColors.kMainColor,
        centerTitle: true,
      ),
      body: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is PaymentRequestTokenSuccessStates) {

            // navigateTo(context, const ToggleScreen());
          }
        },
        builder: (context, state) {
          var cubit = PaymentCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Container(
                    child: Image.network(
                      'https://img.freepik.com/free-vector/mail-service-vehicle-front-post-office-entrance-postman-pulling-cart-illustration_1284-62864.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.42,
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: DefaultTextFormFiled(
                                controller: firstNameController,
                                type: TextInputType.name,
                                hintText: 'First name',
                                prefix: Icons.person,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your first name!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: DefaultTextFormFiled(
                                controller: lastNameController,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your last name !';
                                  }
                                  return null;
                                },
                                type: TextInputType.name,
                                hintText: 'Last name',
                                prefix: Icons.person,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        DefaultTextFormFiled(
                          controller: emailController,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email  !';
                            }
                            return null;
                          },
                          type: TextInputType.emailAddress,
                          hintText: 'Email',
                          prefix: Icons.email,
                        ),
                        const SizedBox(height: 10),
                        DefaultTextFormFiled(
                          controller: phoneController,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone !';
                            }
                            return null;
                          },
                          type: TextInputType.number,
                          hintText: 'Phone',
                          prefix: Icons.phone,
                        ),
                        const SizedBox(height: 10),
                        DefaultTextFormFiled(
                          controller: priceController,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your price !';
                            }
                            return null;
                          },
                          type: TextInputType.number,
                          hintText: 'Price',
                          prefix: Icons.monetization_on,
                        ),
                        const SizedBox(height: 20),
                        DefaultButton(
                          buttonWidget:
                          state is! PaymentRequestTokenLoadingStates
                              ? const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 1.6,
                            ),
                          )
                              : const Center(
                            child: CircularProgressIndicator(),
                          ),
                          function: () {
                            if (formKey.currentState!.validate()) {
                              cubit.getAuthToken();
                              cubit.getOrderRegistrationID(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                price: priceController.text,
                              );
                            }
                          },
                          width: MediaQuery.of(context).size.width,
                          radius: 10.0,
                          backgroundColor:AppColors.kMainColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}