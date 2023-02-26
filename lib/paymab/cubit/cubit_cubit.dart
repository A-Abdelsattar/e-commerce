import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla/paymab/api_const.dart';
import 'package:salla/paymab/cubit/cubit_state.dart';
import 'package:salla/paymab/models/authentication_request_model.dart';
import 'package:salla/paymab/models/order_registration_model.dart';
import 'package:salla/paymab/models/payment_request_model.dart';
import 'package:salla/services/dio_helper/dio_helper.dart';
import 'package:salla/services/sp_helper/chach_helper.dart';
import 'package:salla/services/sp_helper/chach_keys.dart';


class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialStates());
  static PaymentCubit get(context) => BlocProvider.of(context);
  AuthenticationRequestModel? authTokenModel;

  Future<void> getAuthToken() async {
    emit(PaymentAuthLoadingStates());
    DioHelper.postData(url: ApiConst.getAuthToken, data: {
      'api_key': ApiConst.paymentApiKey,
    }).then((value) {
      authTokenModel = AuthenticationRequestModel.fromJson(value.data);
      print("token111111${authTokenModel!.token}");
      ApiConst.paymentFirstToken = authTokenModel!.token;
      emit(PaymentAuthSuccessStates());
    }).catchError((error) {
      emit(
        PaymentAuthErrorStates(error.toString()),
      );
    });
  }

  Future getOrderRegistrationID({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    emit(PaymentOrderIdLoadingStates());
    print("token:${ApiConst.paymentFirstToken}");
    DioHelper.postData(url: ApiConst.getOrderId, data: {
      'auth_token': ApiConst.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items": [],
    }).then((value) {
      print('herare');
      OrderRegistrationModel orderRegistrationModel =
      OrderRegistrationModel.fromJson(value.data);
      ApiConst.paymentOrderId = orderRegistrationModel.id.toString();
      getPaymentRequest(price, firstName, lastName, email, phone);
      emit(PaymentOrderIdSuccessStates());
    }).catchError((error) {
      print("erorrrrrrrrrrr");
      emit(
        PaymentOrderIdErrorStates(error.toString()),
      );
    });
  }

  // for final request token

  Future<void> getPaymentRequest(
      String priceOrder,
      String firstName,
      String lastName,
      String email,
      String phone,
      ) async {
    emit(PaymentRequestTokenLoadingStates());
    DioHelper.postData(
      url: ApiConst.getPaymentRequest,
      data: {
        "auth_token": ApiConst.paymentFirstToken,
        "amount_cents": priceOrder,
        "expiration": 3600,
        "order_id": ApiConst.paymentOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstName,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": ApiConst.integrationIdCard,
        "lock_order_when_paid": "false"
      },
    ).then((value) {
      PaymentRequestModel paymentRequestModel =
      PaymentRequestModel.fromJson(value.data);
      ApiConst.finalToken = paymentRequestModel.token;
      emit(PaymentRequestTokenSuccessStates());
    }).catchError((error) {
      emit(
        PaymentRequestTokenErrorStates(error.toString()),
      );
    });
  }

  Future getRefCode() async {
    DioHelper.postData(
      url: ApiConst.getRefCode,
      data: {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR",
        },
        "payment_token": ApiConst.finalToken,
      },
    ).then((value) {
      ApiConst.refCode = value.data['id'].toString();
      emit(PaymentRefCodeSuccessStates());
    }).catchError((error) {
      emit(PaymentRefCodeErrorStates(error.toString()));
    });
  }
}