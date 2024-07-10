
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/src/response.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart' ;
import 'package:mobile_project/network/remote/constant.dart';


import '../../../../network/remote/cache_helper.dart';
import '../../../../network/remote/dio_file.dart';
import 'login_status.dart';


class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);


  Future<int?> userLogin(
      {required String email, required String password}) async {
    emit(LoginLoading());
    int? message = 404;
    try {
      Response? response = await DioHelperStore.postData(
        url: ApiConstants.loginApi,
        data: {"nationalID": email, "password": password},
      );
      if(response?.statusCode==200) {
        message = response?.statusCode;

        CacheHelper.saveData(key: "nationalId", value: password );
        log("${CacheHelper.getData(key: "nationalId")}");
        emit(Loginsuccessflly());
      }
      return message;
    } catch (e) {
        return 404 ;
    }
  }
}
