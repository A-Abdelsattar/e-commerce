import 'package:flutter/material.dart';
import 'package:salla/services/dio_helper/dio_helper.dart';
import 'package:salla/services/sp_helper/chach_helper.dart';
import 'package:salla/src/app_root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  SharedPreferencesHelper.init();
  runApp(const AppRoot());
}
